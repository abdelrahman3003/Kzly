import 'package:flowers_store/controllers/category/category_controller.dart';
import 'package:flowers_store/controllers/home/home_page_controller.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/themes/shadow_themes.dart';
import 'package:flowers_store/views/widgets/shared/category_card.dart';
import 'package:flowers_store/views/widgets/shared/content/kzly_content.dart';
import 'package:flowers_store/views/sheets/filters/product_filter_sheet.dart';
import 'package:flowers_store/views/widgets/shared/kzly_flower_card.dart';
import 'package:flowers_store/views/widgets/kzly_promotion_bar.dart';
import 'package:flowers_store/views/widgets/shared/kzly_searchbar.dart';
import 'package:flowers_store/views/widgets/review/review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return Scaffold(
      body: GetBuilder<HomePageControllerImp>(
          builder: (controller) => controller.statusRequest == StatusRequest.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
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
                        onNotificationPressed: () => Get.toNamed(kNotificationPage),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        addAutomaticKeepAlives: true,
                        children: [
                          const SizedBox(height: 12),
                          const KzlyPromotionBar(),
                          const SizedBox(height: 12),
                          // Flower Cards
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: KzlyContent(
                              title: "Products",
                              onPressed: () {
                                Get.toNamed(kProductsPage);
                              },
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: controller.productsList.isEmpty
                                  ? const SizedBox()
                                  : GridView.builder(
                                      itemCount: 4,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: .68,
                                              crossAxisSpacing: 10),
                                      itemBuilder: (context, index) =>
                                          KzlyFlowerCard(
                                        isFavourite: controller.checkFavoutite(
                                            controller.productsList[index].id),
                                        onTapHurt: (val) {
                                          controller.onFavorite(
                                              controller.productsList[index].id);
                                          return Future.value(!val);
                                        },
                                        onTap: () => Get.toNamed(kProdoctDetailsPage,
                                            arguments:
                                                controller.productsList[index].id),
                                        product: controller.productsList[index],
                                        onPressedAddCart: () {
                                          controller.addToCart(
                                              controller.productsList[index].id);
                                        },
                                      ),
                                    )),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: KzlyContent(
                              title: "Discover all Categories",
                              onPressed: () => Get.toNamed(kAllCategoriesPage),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            height: 150,
                            child: GetBuilder<CategoryController>(
                                init: CategoryController(),
                                builder: (categoryController) {
                                  if (categoryController.statusRequest ==
                                      StatusRequest.success) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          categoryController.categories.length,
                                      itemBuilder: (context, index) => CategoryCard(
                                        onTap: () => Get.toNamed(
                                            kCategoriesDetailsPage,
                                            arguments: categoryController
                                                .categories[index].id),
                                        title: categoryController
                                            .categories[index].name.capitalize!,
                                        imagePath: categoryController
                                            .categories[index].image.imageUrl,
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                }),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: KzlyContent(title: "Reviews", onPressed: () {}),
                          ),
                          Container(
                            height: 120,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [ReviewCard(), ReviewCard(), ReviewCard()],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ],
                )),
    );
  }
}
