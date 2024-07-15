import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class GalleryImagesController extends GetxController {
  changepage(int i);
}

class GalleryImagesControllerImp extends GalleryImagesController {
  int pageCount = 0;
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
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageCount = Get.arguments['index'];
    pageController = PageController(initialPage: pageCount);
  }
}
