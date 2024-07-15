import 'package:flowers_store/controllers/category/category_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/themes/shadow_themes.dart';
import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flowers_store/views/widgets/shared/category_card.dart';
import 'package:flowers_store/views/widgets/shared/kzly_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KzlyColors.white,
        title: Text(
          "Categories",
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
              GetBuilder<CategoryController>(
                  init: CategoryController(),
                  builder: (controller) {
                    return Expanded(
                        child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: controller.categories.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          onTap: () => Get.toNamed(kCategoriesDetailsPage),
                          title: controller.categories[index].name.capitalize!,
                          imagePath: controller.categories[index].image.imageUrl,
                        );
                      },
                    ));
                  })
            ],
          )),
    );
  }
}
