import 'dart:developer';
import 'package:flowers_store/data/model/addresses/address_data_model.dart';
import 'package:flowers_store/data/source/remote/address/address_remote.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressController extends GetxController {
  void deleteItemList({required int index});
  void selectItemList({required int index});
  Future<void> saveData();
  cleanData();
  addNewAddress();
}

class AddressControllerImp extends AddressController {
  AddressRemoteDataSource addressRemoteDataSource =
      AddressRemoteDataSource(Get.find());
  List<AddressDataModel> addressDataList = [];
  int? choice;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController streetController = TextEditingController();

  final TextEditingController blockController = TextEditingController();

  final TextEditingController buildingController = TextEditingController();

  final TextEditingController floorController = TextEditingController();

  final TextEditingController apartmentController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController countryController = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  int pageNum = 1;
  ScrollController scrollController = ScrollController();
  bool hasMore = false;
  @override
  void onInit() {
    super.onInit();
    getAddresses();
    handlePagenationScrolling();
  }

  @override
  void cleanData() {
    log("Clean Data");
    locationController.clear();
    streetController.clear();
    blockController.clear();
    buildingController.clear();
    floorController.clear();
    apartmentController.clear();
    cityController.clear();
    countryController.clear();
    update();
  }

  @override
  deleteItemList({required int index}) async {
    statusRequest = StatusRequest.deleteLoading;
    update();
    var response = await addressRemoteDataSource.deleteSpecificAddress(
        addressId: addressDataList[index].id);
    if (response["message"] == "success") {
      statusRequest = StatusRequest.success;
      addressDataList.removeAt(index);
      log("---------------------------------------------------");
      log(addressDataList.toString());
      Get.back();
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
    hasMore = false;
    log("DeleteAddressesOfUser");
    update();
  }

  @override
  void selectItemList({required int index}) {
    update();
  }

  @override
  saveData() async {
    if (formKey.currentState!.validate()) {
      Map response = {};
      if (Get.arguments!=null) {
        ///This is Edit Address
      } else {
        statusRequest = StatusRequest.createLoading;
        update();
        ///This is Add New Address
        response = await addressRemoteDataSource.createOrdinaryAddress(
            country: countryController.text,
            state: "upper egypt",
            city: cityController.text,
            street: streetController.text,
            buildingNumber: int.parse(buildingController.text),
            floorNumber: int.parse(floorController.text),
            apartmentNumber: int.parse(apartmentController.text),
            homeDescription:
                "my name is mohannmed and abo elsoud is stupied af  my name is mohammed medhat");
      }
      if (response["message"] == "success") {
        pageNum = 1;
        hasMore = false;
        addressDataList.clear();
        GetSnackBar(
            title: response["message"].toString().capitalizeFirst,
            message: "Your Address has been created successfully",
            duration: const Duration(seconds: 5),
            backgroundColor: KzlyColors.green);
        Get.back();
        await getAddresses();
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

  @override
  addNewAddress() {
    cleanData();
    Get.toNamed(kEditOrAddAddressPage);
  }

  Future<void> getAddresses() async {
    if (!hasMore) {
      statusRequest = StatusRequest.loading;
      update();
    }
    var response = await addressRemoteDataSource.getAllAddresses(page: pageNum);
    if (response["message"] == "success") {
      statusRequest = StatusRequest.success;
      hasMore = true;
      for (var element in response["data"]) {
        addressDataList.add(AddressDataModel.fromJson(element));
      }
      log("---------------------------------------------------");
      log(addressDataList.toString());
      pageNum++;
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
      hasMore = false;
    }
    log("getAddressesOfUser");
    update();
  }

  void handlePagenationScrolling() {
    log("HandlePagenationScrolling");
    scrollController.addListener(() async {
      log("Scroll Controller Listener");
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        log("PageNum:$pageNum");
        hasMore = true;
        await getAddresses();
      }
    });
  }
}
