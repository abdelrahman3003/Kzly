import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  pageInchanged(int index);
  pickFile();
}

class OnboardingControllerImp extends OnboardingController {
  int pagecount = 0;
  PageController pageController = PageController();
  bool isfinish = false;
  AppServices appServices = Get.find();
  FilePickerResult? result;
  String? filename;
  PlatformFile? pickedFIle;
  File? fileToDisplay;
  @override
  next() {
    pagecount++;
    appServices.sharedPreferences.setString("step", "1");
    pageController.animateToPage(pagecount,
        duration: const Duration(milliseconds: 900), curve: Curves.ease);
    update();
  }

  @override
  pageInchanged(index) {
    pagecount = index;
    update();
  }

  @override
  pickFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      filename = result!.files.first.name;
      pickedFIle = result!.files.first;
      fileToDisplay = File(pickedFIle!.path!);
    } else {
      // User canceled the picker
    }
  }
}
