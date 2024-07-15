// import 'package:flowers_store/controller/product_details_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// abstract class ImagesGalleryController extends GetxController {
//   changepage(int i);
// }

// class ImagesGalleryControllerImp extends ImagesGalleryController {
//   ProductDetailsControllerImp productDetailsControllerImp =
//       Get.put(ProductDetailsControllerImp());

//   PageController? pageController;
//   int pageCount = 0;
//   List<String> images = [];
//   @override
//   changepage(i) {
//     pageCount = i;
//     pageController = PageController(initialPage: pageCount);
//     update();
//   }

//   @override
//   void onInit() {
//     pageCount = productDetailsControllerImp.pageCount;
//     images = productDetailsControllerImp.images;
//     super.onInit();
//   }
// }
