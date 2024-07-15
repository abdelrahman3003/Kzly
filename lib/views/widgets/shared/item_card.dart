import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/product_details_controller.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(builder: (controller) {
      return SizedBox(
          height: Get.width,
          child: Stack(children: [
            PageView.builder(
              itemCount: controller.images.length,
              controller: controller.pageController,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Get.toNamed(kImagesGallery, arguments: {"index": index});
                    },
                    child: Hero(
                      tag: controller.images[index],
                      child: Image.asset(controller.images[index],
                          fit: BoxFit.contain),
                    ));
              },
              onPageChanged: (value) => controller.changepage(value),
            ),
            Positioned.fill(
              bottom: 5.h,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        controller.images.length,
                        (index) => AnimatedContainer(
                            margin: const EdgeInsets.only(right: 5),
                            duration: const Duration(milliseconds: 300),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color: controller.pageCount == index
                                    ? KzlyColors.primary
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20)))))
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15.h,
              right: 15.h,
              child: Text(
                "#1 Most Seller",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: KzlyColors.primary,
                ),
              ),
            )
          ]));
    });
  }
}
