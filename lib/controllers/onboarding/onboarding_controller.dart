import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  pageInchanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  int pagecount = 0;
  PageController pageController = PageController();
  bool isfinish = false;
  AppServices appServices = Get.find();
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
}