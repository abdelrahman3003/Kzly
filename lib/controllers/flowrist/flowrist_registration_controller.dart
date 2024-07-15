import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flowers_store/data/model/florist/florist_register.dart';
import 'package:flowers_store/data/source/remote/florist/florist_sign_up.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FlowristRegisterationController extends GetxController {
  selected(String selectedtext);
  Future<void> pickFile(int index);
  disposeFile(int index);
  addCertificate();
  submit();
  onSecure(String text);
}

class FlowristRegisterationControllerImp extends FlowristRegisterationController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confPassword = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController nationalId = TextEditingController();
  List<String> sections = [];
  final TextEditingController url = TextEditingController();
  List<TextEditingController> ceritficateControllerList = [];
  final TextEditingController cvController = TextEditingController();
  List<File?> pickCertificateList = [];
  File? cvfile;
  bool isPasswordSecure = true;
  bool isConfirmSecure = true;
  FloristSignUp floristSignUp = FloristSignUp(Get.find());
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  @override
  selected(String selectedtext) {
    if (sections.contains(selectedtext)) {
      sections.remove(selectedtext.toLowerCase());
    } else {
      sections.add(selectedtext.toLowerCase());
    }
    update();
  }

  @override
  pickFile(int index, {bool iscv = false}) async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
          withReadStream: true,
          type: FileType.custom,
          allowedExtensions: ['pdf', 'doc']);
      if (result != null) {
        for (var files in result.files) {
          if (iscv) {
            cvfile = File(files.path!);
            cvController.text = files.name;
          } else {
            ceritficateControllerList[index].text = files.name;
            pickCertificateList.removeAt(index);
            pickCertificateList.add(File(files.path!));
          }
        }
      } else {
        ///make Here any thing
        log("The Current list: ${pickCertificateList.toString()}");
      }
      update();
    } catch (error) {
      log("Error:$error");
    }
  }

  @override
  disposeFile(int index, {bool iscv = false}) {
    log("$index");
    if (iscv) {
      cvController.clear();
    } else {
      if (index == 0) {
        pickCertificateList[index] = null;
        ceritficateControllerList[index].clear();
      } else {
        pickCertificateList.removeAt(index);
        ceritficateControllerList.removeAt(index);
      }
    }
    update();
  }

  @override
  addCertificate() {
    pickCertificateList.length++;
    for (var i = ceritficateControllerList.length;
        i < pickCertificateList.length;
        i++) {
      ceritficateControllerList.add(TextEditingController());
    }
    log("${pickCertificateList.length}");
    log("CTL: ${ceritficateControllerList.length}");
    log(pickCertificateList.toString());
    update();
  }

  @override
  submit() async {
    if (formKey.currentState!.validate() && sections.isNotEmpty) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await floristSignUp.floristSignUp(
          floristData: FloristRegister(
            fullName: fullname.text,
            phone: phone.text,
            email: email.text,
            password: password.text,
            gender: "male",
            nationalId: nationalId.text,
            videoURL: url.text,
            section: sections,
          ),
          certifications: pickCertificateList.map((e) => e!.path).toList(),
          cv: File(cvfile!.path));
      if (response["status"] == "success") {
        statusRequest = StatusRequest.success;
        log("======================Succes===================================");
        log(response.toString());
        Get.offAllNamed(kOtpVerificationPage,
                arguments: {'id': response['user']['_id']})
            ?.then((value) => Get.showSnackbar(const GetSnackBar(
                title: "success",
                message: "Your account has been created successfully",
                duration: Duration(seconds: 5),
                backgroundColor: KzlyColors.green)));
      } else {
        log("======================Fauiler===================================");
        statusRequest = StatusRequest.failure;
        log(response.toString());
        Get.showSnackbar(
          GetSnackBar(
            message: response["status"].toString().capitalizeFirst,
            duration: const Duration(seconds: 5),
          ),
        );
      }
      update();
    } else if (sections.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          message: "select at least on section",
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  onSecure(String text) {
    if (text == "Password") {
      isPasswordSecure = !isPasswordSecure;
    } else {
      isConfirmSecure = !isConfirmSecure;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pickCertificateList.length++;
    for (var i = 0; i < pickCertificateList.length; i++) {
      ceritficateControllerList.add(TextEditingController());
    }
    log("${pickCertificateList.length}");
    log("${pickCertificateList[0]}");
    log(pickCertificateList.toString());
    log("CT:${ceritficateControllerList.length}");
  }
}
