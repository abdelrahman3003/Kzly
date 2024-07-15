import 'package:flowers_store/data/model/product/product_model_back.dart';
import 'package:flowers_store/data/source/remote/cart/cart_data.dart';
import 'package:flowers_store/data/source/remote/favorite/favourite_data.dart';
import 'package:flowers_store/data/source/remote/product/product_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageController extends GetxController {
  addToCart(String productId);
  onFavorite(String productId);
  getallProduct();
  bool checkFavoutite(String productId);
  getMyfavourite();
  onSearch(String val);
}

class HomePageControllerImp extends HomePageController {
  ProductData homeData = ProductData(Get.find());
  FavouriteData favouriteData = FavouriteData(Get.find());
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  bool isFavourite = true;
  List<Product> productsList = [];
  List myFavouritesList = [];
  @override
  void onInit() {
    getMyfavourite();
    getallProduct();
    super.onInit();
  }

  @override
  addToCart(String productId) async {
    Get.rawSnackbar(
        backgroundColor: KzlyColors.primary,
        title: "",
        messageText: const Text("Product add to cart",
            style: TextStyle(color: KzlyColors.white)));
    await cartData.addtoMyCart(productId);

    update();
  }

  @override
  onFavorite(String productId) async {
    if (checkFavoutite(productId)) {
      myFavouritesList.remove(productId);
      await favouriteData.removeFromFavourite(productId);
    } else {
      myFavouritesList.add(productId);
      await favouriteData.addToFavourite(productId);
    }

    update();
  }

  @override
  getallProduct() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getallProducts();
    List data = response["data"];
    if (response["status"] == "success") {
      productsList.addAll(data.map((e) => Product.fromJson(e)));
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  checkFavoutite(String productId) {
    if (myFavouritesList.contains(productId)) {
      return true;
    }
    return false;
  }

  @override
  getMyfavourite() async {
    var response = await favouriteData.getMyfavourites();
    List data = response["data"]["products"];
    if (response["status"] == "success") {
      myFavouritesList.addAll(data.map((e) => e['_id']));
    }
    update();
  }

  @override
  onSearch(String val) {}
}
