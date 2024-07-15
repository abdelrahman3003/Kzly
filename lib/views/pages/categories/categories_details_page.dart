import 'package:flowers_store/controllers/home/home_page_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/themes/shadow_themes.dart';
import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flowers_store/views/widgets/shared/kzly_flower_card.dart';
import 'package:flowers_store/views/widgets/shared/kzly_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesDetailsPage extends GetView {
  const CategoriesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: KzlyColors.white,
          title: Text(
            controller.productsList.first.category?.name.capitalize ?? "Category",
            style: TextThemes.label,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: KzlyColors.white,
                  boxShadow: [BoxShadowThemes.mainShadow],
                ),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: KzlySearchBar(
                  backgroundColor: KzlyColors.white,
                  onSubmit: (e) {},
                  onFilterPressed: () {},
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        SizedBox(height: 8.h),
                        controller.productsList.isEmpty
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
                                itemBuilder: (context, index) => KzlyFlowerCard(
                                  isFavourite: controller.checkFavoutite(
                                      controller.productsList[index].id),
                                  onTapHurt: (val) {
                                    controller.onFavorite(
                                        controller.productsList[index].id);
                                    return Future.value(!val);
                                  },
                                  onTap: () => Get.toNamed(kProdoctDetailsPage,
                                      arguments: controller.productsList[index].id),
                                  product: controller.productsList[index],
                                  onPressedAddCart: () {
                                    controller.addToCart(
                                        controller.productsList[index].id);
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
