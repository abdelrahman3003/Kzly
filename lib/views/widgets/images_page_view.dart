import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_details_controller.dart';

class ImagesPageView extends GetView<ProductDetailsControllerImp> {
  const ImagesPageView({super.key, required this.onTap, required this.widget});
  final Function()? onTap;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: controller.images.length,
      controller: controller.pageController,
      itemBuilder: (context, index) {
        index = controller.pageCount;
        return GestureDetector(
          onTap: () {},
          child: widget,
        );
      },
      onPageChanged: (value) => controller.changepage(value),
    );
  }
}
