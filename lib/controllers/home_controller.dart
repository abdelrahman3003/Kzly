import 'package:flowers_store/controllers/cart/cart_controller.dart';
import 'package:flowers_store/controllers/favourite/favourite_controller.dart';
import 'package:flowers_store/controllers/profile/profile_controller.dart';
import 'package:flowers_store/views/pages/navigation/cart_view.dart';
import 'package:flowers_store/views/pages/navigation/favourites_view.dart';
import 'package:flowers_store/views/pages/navigation/home_view.dart';
import 'package:flowers_store/views/pages/navigation/profile_view.dart';
import 'package:flowers_store/views/pages/navigation/others_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int pageCount = 0;

  List<Widget> pageList = [
    const HomePage(),
    const CartView(),
    const OthersView(),
    const FavouriteView(),
    const ProfileView(),
  ];
  @override
  changepage(i) {
    switch (i) {
      case 0:
        Get.delete<CartControllerImp>();
        Get.delete<FavouriteControllerImp>();
        Get.delete<ProfileControllerImp>();
        break;
      case 1:
        Get.delete<HomeScreenControllerImp>();
        Get.delete<FavouriteControllerImp>();
        Get.delete<ProfileControllerImp>();
        break;
      case 2:
        Get.delete<CartControllerImp>();
        Get.delete<FavouriteControllerImp>();
        Get.delete<ProfileControllerImp>();
        Get.delete<HomeScreenControllerImp>();
        break;
      case 3:
        Get.delete<CartControllerImp>();
        Get.delete<HomeScreenControllerImp>();
        Get.delete<ProfileControllerImp>();
        break;
      case 4:
        Get.delete<CartControllerImp>();
        Get.delete<FavouriteControllerImp>();
        Get.delete<HomeScreenControllerImp>();
        break;
      // Add cases for other pages
    }
    pageCount = i;
    update();
  }

  @override
  void onInit() {
    if (Get.arguments!=null) {
      pageCount = Get.arguments['pagecount'];
      super.onInit();
    }
  }
}
