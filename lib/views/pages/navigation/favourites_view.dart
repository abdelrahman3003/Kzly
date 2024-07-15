import 'package:flowers_store/controllers/favourite/favourite_controller.dart';
import 'package:flowers_store/data/source/static/product_data_static.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/widgets/shared/kzly_flower_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavouriteControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Favorites",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: GetBuilder<FavouriteControllerImp>(builder: (controller) {
          return controller.myFavouritesList.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          itemCount: controller.myFavouritesList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: .7,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) => KzlyFlowerCard(
                            isFavourite: true,
                            product: controller.myFavouritesList[index],
                            onTapHurt: (val) {
                              controller.onFavorite(index);
                              return Future.value(!val);
                            },
                            onTap: () => Get.toNamed(kProdoctDetailsPage,
                                arguments: controller.myFavouritesList[index].id),
                            onPressedAddCart: () {
                              controller.addTocart(favouriteList[index]);
                            },
                          ),
                        ))
                  ],
                ))
              : controller.statusRequest == StatusRequest.loading
                  ? const Center(child: CircularProgressIndicator())
                  : const Center(child: Text("not product found"));
        }));
  }
}
