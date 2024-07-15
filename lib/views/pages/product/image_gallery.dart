import 'package:flowers_store/controllers/gallery_images_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImagesGallery extends StatelessWidget {
  const ImagesGallery({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GalleryImagesControllerImp());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),
        ),
        body: GetBuilder<GalleryImagesControllerImp>(
          builder: (controller) => Stack(
            children: [
              PageView.builder(
                itemCount: controller.images.length,
                controller: controller.pageController,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Hero(
                      tag: controller.images[index],
                      child: PhotoView(
                        backgroundDecoration:
                            const BoxDecoration(color: Colors.white),
                        customSize: Get.size,
                        imageProvider: AssetImage(controller.images[index]),
                      ),
                    ),
                  );
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
            ],
          ),
        ));
  }
}
