import 'package:flowers_store/controllers/home/home_page_controller.dart';
import 'package:flowers_store/data/source/static/product_data_static.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/sheets/filters/product_filter_sheet.dart';
import 'package:flowers_store/views/themes/shadow_themes.dart';
import 'package:flowers_store/views/widgets/shared/kzly_flower_card.dart';
import 'package:flowers_store/views/widgets/shared/kzly_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: KzlyColors.white,
      ),
      body: GetBuilder<HomePageControllerImp>(builder: (controller) {
        return Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: KzlyColors.white,
                boxShadow: [BoxShadowThemes.mainShadow],
              ),
              padding: const EdgeInsets.all(16),
              child: KzlySearchBar(
                onSubmit: (value) {
                  print(value);
                },
                onFilterPressed: () => ProductFilterSheet.show(),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    itemCount: productModelLsit.length,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .68,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) => KzlyFlowerCard(
                      isFavourite: controller
                          .checkFavoutite(controller.productsList[index].id),
                      onTapHurt: (val) {
                        controller.onFavorite(controller.productsList[index].id);
                        return Future.value(!val);
                      },
                      onTap: () => Get.toNamed(kProdoctDetailsPage,
                          arguments: controller.productsList[index].id),
                      product: controller.productsList[index],
                      onPressedAddCart: () {
                        controller.addToCart(controller.productsList[index].id);
                      },
                    ),
                  )),
            ),
          ],
        );
      }),
    );
  }
}
