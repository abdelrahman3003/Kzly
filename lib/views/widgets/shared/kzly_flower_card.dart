import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowers_store/controllers/home/home_page_controller.dart';
import 'package:flowers_store/data/model/product/product_model_back.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/widgets/shared/kzly_like_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class KzlyFlowerCard extends StatelessWidget {
  const KzlyFlowerCard({
    super.key,
    required this.product,
    this.onTapHurt,
    this.onPressedAddCart,
    required this.isFavourite,
    required this.onTap,
  });

  final Product product;
  final Future<bool?> Function(bool)? onTapHurt;
  final void Function()? onPressedAddCart;
  final bool isFavourite;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(builder: (controller) {
      return InkWell(
        customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 180.h,
                    width: 180.w,
                    child: CachedNetworkImage(
                      imageUrl: product.mainImage?["imageUrl"] ??
                          "https://res.cloudinary.com/di6nk1mov/image/upload/v1716717635/ghrl7l0nn2ew3cbg85n6.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: KzlyLikeButton(
                          isLiked: isFavourite,
                          onTap: onTapHurt,
                        )),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: const BoxDecoration(
                        color: KzlyColors.primary,
                      ),
                      child: const Text("#1 Best Seller",
                          style: TextStyle(
                              color: KzlyColors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style:
                          const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " ${product.price}",
                      style:
                          const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
                      itemSize: 14,
                      initialRating: product.rating ?? 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Text(
                      product.isOutOfStock ?? false ? "In Stock" : "Out of Stock",
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 28,
              child: FilledButton(
                  onPressed: onPressedAddCart,
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    fixedSize: Size(Get.width, 20),
                    backgroundColor: KzlyColors.primary,
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: const TextStyle(fontSize: 12),
                  )),
            )
          ],
        ),
      );
    });
  }
}
