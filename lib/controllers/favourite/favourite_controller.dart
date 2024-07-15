import 'package:flowers_store/data/model/product/product_model_back.dart';
import 'package:flowers_store/data/model/product_model.dart';
import 'package:flowers_store/data/source/remote/favorite/favourite_data.dart';
import 'package:flowers_store/data/source/static/product_data_static.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavouriteController extends GetxController {
  removeFavourite(PruductModel pruductModel);
  addTocart(PruductModel pruductModel);
  getMyfavourites();
  onFavorite(int index);
}

class FavouriteControllerImp extends FavouriteController {
  FavouriteData favouriteData = FavouriteData(Get.find());
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  List<Product> myFavouritesList = [];

  @override
  void onInit() {
    super.onInit();
    getMyfavourites();
  }

  @override
  onFavorite(int index) async {
    String id = myFavouritesList[index].id;
    myFavouritesList.removeAt(index);
    update();
    await favouriteData.removeFromFavourite(id);
  }

  @override
  removeFavourite(PruductModel pruductModel) {
    pruductModel.isFavorite = false;
    favouriteList.remove(pruductModel);
    Get.rawSnackbar(
        backgroundColor: KzlyColors.primary,
        title: "",
        messageText: const Text("Product was removed",
            style: TextStyle(color: KzlyColors.white)));
    update();
  }

  @override
  addTocart(PruductModel pruductModel) {
    if (pruductModel.cartCount == 0) {
      cartList.add(pruductModel);
    }
    pruductModel.cartCount++;
    Get.rawSnackbar(
        backgroundColor: KzlyColors.primary,
        title: "",
        messageText: const Text("Product add to cart",
            style: TextStyle(color: KzlyColors.white)));
    update();
  }

  @override
  getMyfavourites() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favouriteData.getMyfavourites();
    List data = response["data"]['products'];
    if (response["status"] == "success") {
      statusRequest = StatusRequest.success;
      myFavouritesList.addAll(data.map((e) => Product.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
