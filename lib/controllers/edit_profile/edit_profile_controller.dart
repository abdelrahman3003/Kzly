import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flowers_store/data/model/florist/florist_data_model.dart';
import 'package:flowers_store/data/model/schedule/schedule_model.dart';
import 'package:flowers_store/data/source/remote/profile/profile_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

abstract class FolweristAndCoachesEditProfileController extends GetxController {
  ///This For Images
  Future<void> pickImage(int index);
  removeWorkImage(int index);
  addAnotherWork();
  uploadInfo();

  ///Add Schedule Page Methods
  selectDay(String value);
  chooseTime({bool isStartTime = false, required int index});
  addAnotherRowofTime();
  bool checkTime({required int index, required String endTime});
  deleteRowOfTime({required int index});
  saveSchedule();
  cleanData();
  editData({required MapEntry<String, List<ScheduleTimeDataModel>> data});
}

class FolweristAndCoachesEditProfileControllerImp
    extends FolweristAndCoachesEditProfileController {
  ProfileData profileData = ProfileData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  FloristDataModel floristDataModel = FloristDataModel();
  final bool isFlowerist;
  FolweristAndCoachesEditProfileControllerImp({required this.isFlowerist});
  final GlobalKey<FormState> infoformKey = GlobalKey<FormState>();

  ///Florist Variables
  TextEditingController descriptionController = TextEditingController();
  List<FloristWorkModel> worksimagesList = [];
  TextEditingController urlController = TextEditingController();
  TextEditingController costController = TextEditingController();
  List<String> selectedSection = [];

  ///Add Schedule Page Variables
  String day = "";
  List<ScheduleTimeDataModel> timeLists = [];
  final GlobalKey<FormState> scheduleformKey = GlobalKey<FormState>();
  var selectedTime = TimeOfDay.now();

  @override
  void onInit() async {
    super.onInit();
    timeLists.add(ScheduleTimeDataModel());
    if (isFlowerist) {
      await getFloristInfo();
    } else {
      ///Here Make Request To Api To Get CoachInformation
      log("Get Coach Information");
    }
  }

  ///This Function To pickImage
  @override
  Future<void> pickImage(int index) async {
    try {
      final FilePickerResult? result = await FilePicker.platform
          .pickFiles(withReadStream: true, type: FileType.image);
      if (result != null) {
        for (var files in result.files) {
          await uploadWorkImage(File(files.path!));
        }
      } else {
        ///make Here any thing
        log("The Current list: ${worksimagesList.toString()}");
      }
      update();
    } catch (error) {
      log("Error:$error");
    }
  }

  ///This To Delete Work Image From Data Base
  @override
  removeWorkImage(int index) async {
    var response = await profileData.deleteWorkImage(id: worksimagesList[index].id);
    if (response["message"] == "success") {
      statusRequest = StatusRequest.success;
      floristDataModel = FloristDataModel.fromJson(response["data"]);
      statusRequest = StatusRequest.success;
      worksimagesList = floristDataModel.work.isNotEmpty
          ? List.from(floristDataModel.work)
          : List.from([const FloristWorkModel(id: '', imageUrl: '')]);
    } else {
      if (response["status"] == "offline") {
        statusRequest = StatusRequest.offlineFailure;
      } else {
        statusRequest = StatusRequest.failure;
      }
      Get.showSnackbar(
        GetSnackBar(
          message: response["message"].toString(),
          duration: const Duration(seconds: 5),
        ),
      );
    }
    update();
  }

  ///This To Add Another Work
  @override
  addAnotherWork() {
    worksimagesList.add(const FloristWorkModel(id: '', imageUrl: ''));
    update();
  }

  ///This For Get Florist Information
  Future<void> getFloristInfo() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.getFloristInfo();
    if (response["message"] == "success") {
      statusRequest = StatusRequest.success;
      floristDataModel = FloristDataModel.fromJson(response["data"]);
      descriptionController = TextEditingController(text: floristDataModel.about);
      worksimagesList = floristDataModel.work.isNotEmpty
          ? List.from(floristDataModel.work)
          : List.from([const FloristWorkModel(id: '', imageUrl: '')]);
      urlController = TextEditingController(text: floristDataModel.videoURL);
      costController = TextEditingController(text: floristDataModel.hourCost);

      for (var element in floristDataModel.section) {
        selectedSection.add(element!.capitalizeFirst!);
      }
    } else {
      if (response["status"] == "offline") {
        statusRequest = StatusRequest.offlineFailure;
      } else {
        statusRequest = StatusRequest.failure;
      }
      Get.showSnackbar(
        GetSnackBar(
          message: response["message"].toString(),
          duration: const Duration(seconds: 5),
        ),
      );
    }
    log("getFloristInfo");
    update();
  }

  ///This for UploadWork Image that in EditInformation
  Future<void> uploadWorkImage(File file) async {
    log(file.path.toString());
    var response = await profileData.uploadWorkImage(file: file);
    if (response["message"] == "success") {
      statusRequest = StatusRequest.success;
      floristDataModel = FloristDataModel.fromJson(response["data"]);
      statusRequest = StatusRequest.success;
      worksimagesList = List.from(floristDataModel.work);
    } else {
      if (response["status"] == "offline") {
        statusRequest = StatusRequest.offlineFailure;
      } else {
        statusRequest = StatusRequest.failure;
      }
      Get.showSnackbar(
        GetSnackBar(
          message: response["message"].toString(),
          duration: const Duration(seconds: 5),
        ),
      );
    }
    update();
  }

  ///This To Upload Discription of Current User
  ///That in EditInformation
  @override
  uploadInfo() async {
    if (infoformKey.currentState!.validate()) {
      var response = await profileData
          .uploadFloristInfo(data: {"about": descriptionController.text});
      if (response["message"] == "success") {
        statusRequest = StatusRequest.success;
        floristDataModel = FloristDataModel.fromJson(response["data"]);
        statusRequest = StatusRequest.success;
        worksimagesList = floristDataModel.work.isNotEmpty
            ? List.from(floristDataModel.work)
            : List.from([const FloristWorkModel(id: '', imageUrl: '')]);
      } else {
        if (response["status"] == "offline") {
          statusRequest = StatusRequest.offlineFailure;
        } else {
          statusRequest = StatusRequest.failure;
        }
        Get.showSnackbar(
          GetSnackBar(
            message: response["message"].toString(),
            duration: const Duration(seconds: 5),
          ),
        );
      }
      update();
    }
  }

  ///This For Selecte Day
  @override
  selectDay(String value) {
    day = value;
    update();
  }

  ///This Function To choose Time From Time Picker
  @override
  chooseTime({bool isStartTime = false, required int index}) async {
    TimeOfDay? pickTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (pickTime != null && pickTime != selectedTime) {
      selectedTime = pickTime;
    }
    log("index : $index");
    if (isStartTime) {
      log("if");
      timeLists[index].startHour = selectedTime.format(Get.context!);
      log("StartHourValue: ${timeLists[index].startHour}");
    } else {
      log("else");
      timeLists[index].endHour = selectedTime.format(Get.context!);
      log("EndHourValue: ${timeLists[index].endHour}");
    }
    selectedTime = TimeOfDay.now();
    update();
  }

  ///This To Add Another Row Of Time
  @override
  addAnotherRowofTime() {
    timeLists.add(ScheduleTimeDataModel());
    log(timeLists.toString());
    log("TL:* ${timeLists.length.toString()}");
    update();
  }

  ///This Function To Check That Start Time Is Before End Time
  @override
  bool checkTime({required int index, required String endTime}) {
    bool result = false;
    var start = DateFormat("hh:mm a").parse(timeLists[index].startHour!.trim());
    var end = DateFormat("hh:mm a").parse(endTime.trim());
    log("Start: $start");
    log("End: $end");
    if (end.isBefore(start)) {
      log("End is Before Start");
      result = true;
    } else if (end.isAfter(start)) {
      log("End is After Start");
    } else {
      log("Same:${start.difference(end)}");
      result = true;
    }
    return result;
  }

  @override
  deleteRowOfTime({required int index}) async {
    if (timeLists[index].id != null) {
      ///Here will Remove it From Data Base
      ///Get Florist Info again
      statusRequest = StatusRequest.loading;
      update();

      var response = await profileData.deleteSchedule(id: timeLists[index].id!);
      if (response["message"] == "success") {
        statusRequest = StatusRequest.success;
        timeLists.removeAt(index);
        if (timeLists.isEmpty) {
          timeLists.add(ScheduleTimeDataModel());
          log(timeLists.length.toString());
          Get.back();
        }
        await getFloristInfo();
      } else {
        if (response["status"] == "offline") {
          statusRequest = StatusRequest.offlineFailure;
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      Get.showSnackbar(
        GetSnackBar(
          title: statusRequest.name.capitalizeFirst,
          message: response["message"].toString(),
          duration: const Duration(seconds: 5),
        ),
      );
      update();
    } else {
      ///Here will Remove time From list That Created By User
      timeLists.removeAt(index);
      update();
    }
  }

  @override
  saveSchedule() async {
    if (scheduleformKey.currentState!.validate()) {
      Map response = {};
      statusRequest = StatusRequest.loading;
      update();
      if (Get.arguments != null) {
        log("Edit");
        response = await profileData.editFloristSchedule(data: {
          "timeSlots": [
            for (var element in timeLists)
              {
                "id": element.id,
                "startHour": element.startHour,
                "endHour": element.endHour
              }
          ]
        });
      } else {
        log("Add New Schedule");
        response = await profileData.uploadFloristSchedule(data: {
          "day": day,
          "dates": timeLists.map((e) => e.toJson()).toList(),
        });
      }
      if (response["message"] == "success") {
        statusRequest = StatusRequest.success;
        Get.back();
        Get.showSnackbar(GetSnackBar(
            title: statusRequest.name.capitalizeFirst,
            message: response["message"].toString().capitalizeFirst,
            duration: const Duration(seconds: 5),
            backgroundColor: KzlyColors.green));
        cleanData();
        await getFloristInfo();
      } else {
        if (response["status"] == "offline") {
          statusRequest = StatusRequest.offlineFailure;
        } else {
          statusRequest = StatusRequest.failure;
        }
        Get.showSnackbar(
          GetSnackBar(
            message: response["message"].toString(),
            duration: const Duration(seconds: 5),
          ),
        );
        update();
      }
    }
  }

  @override
  cleanData() {
    day = "";
    timeLists.clear();
    timeLists.add(ScheduleTimeDataModel());
    update();
  }

  @override
  editData({required MapEntry<String, List<ScheduleTimeDataModel>> data}) {
    day = data.key;
    timeLists.clear();
    timeLists.addAll(data.value);
    update();
  }
}
