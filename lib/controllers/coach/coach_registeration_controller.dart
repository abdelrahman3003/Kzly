import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CoachRegisterationController extends GetxController {
  selected(bool isSelected);
  Future<void> pickFile(int index);
  disposeFile(int index);
  addCertificate();
  submit();
  onSecure(String text);
}

class CoachRegisterationControllerImp extends CoachRegisterationController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController cvController = TextEditingController();
  FilePickerResult? result;
  List<File?> pickCertificateList = [];
  List<TextEditingController> ceritficateControllerList = [];
  String? email;
  String? name;
  String? password;
  String? confPassword;
  String? phone;
  String? phoneSection;
  String? national;
  String? url;
  bool isError = false;
  bool isPasswordSecure = true;
  bool isConfirmSecure = true;
  
  @override
  selected(isSelected) {
    if (isSelected) {
      isSelected = false;
    } else {
      isSelected = true;
    }
    update();
  }

  @override
  pickFile(int index, {bool iscv = false}) async {
    try {
      final FilePickerResult? result =
          await FilePicker.platform.pickFiles(withReadStream: true);
      if (result != null) {
        for (var files in result.files) {
          if (iscv) {
            cvController.text = files.name;
          } else {
            ceritficateControllerList[index].text = files.name;
            pickCertificateList.removeAt(index);
            pickCertificateList.add(File(files.name));
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
  submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      isError = true;
    }
    update();
  }

  @override
  onSecure(String? text) {
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
