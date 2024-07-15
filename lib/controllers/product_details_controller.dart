import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class ProductDetailsController extends GetxController {
  changepage(int i);


  add();
  delete();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  int pageCount = 0;
  int pageCount2 = 0;
  int count = 4;
  List<String> images = [
    "assets/images/test1.jpg",
    "assets/images/test1.jpg",
    "assets/images/test1.jpg",
    "assets/images/test1.jpg",
    "assets/images/test1.jpg",
  ];
  PageController? pageController;
  @override
  changepage(i) {
    pageCount = i;
    pageController = PageController(initialPage: pageCount);
    update();
  }



  @override
  void onInit() {
    super.onInit();
    pageCount2 = pageCount;
  }

  @override
  add() {
    count++;
    update();
  }

  @override
  delete() {
    count--;
    update();
  }
}
