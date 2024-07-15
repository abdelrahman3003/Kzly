import 'package:flowers_store/data/model/product/product_model_back.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    this.backgroundColor,
    this.hideCheckBox,
    this.enableDeleteButton = true,
    this.viewMode,
    required this.product,
    this.onAdd,
    this.onMinus,
    this.onPressedDelte,
    this.onTapCheck,
    this.isCheck = true,
    this.count,
  });

  final bool? enableDeleteButton;
  final void Function()? onAdd;
  final void Function()? onMinus;
  final bool? hideCheckBox;
  final Color? backgroundColor;
  final bool? viewMode;
  final Product product;
  final void Function(BuildContext)? onPressedDelte;
  final dynamic Function(bool?)? onTapCheck;
  final bool isCheck;
  final int? count;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: enableDeleteButton ?? true,
      endActionPane: ActionPane(
          extentRatio: .3,
          motion: const ScrollMotion(),
          dragDismissible: true,
          children: [
            CustomSlidableAction(
              onPressed: onPressedDelte,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(
                  Assets.icons.delete,
                  colorFilter:
                      const ColorFilter.mode(KzlyColors.red, BlendMode.srcIn),
                  width: 21,
                ),
              ),
            ),
          ]),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
            color: backgroundColor ?? KzlyColors.primary,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        RoundCheckBox(
                          onTap: onTapCheck,
                          uncheckedWidget: const Icon(Icons.check_rounded, size: 18),
                          checkedWidget: const Icon(Icons.check_rounded,
                              color: KzlyColors.white, size: 18),
                          disabledColor: Colors.white,
                          checkedColor: const Color.fromRGBO(176, 77, 236, 1),
                          uncheckedColor: Colors.white,
                          isChecked: isCheck,
                          size: 26,
                          border: Border.all(width: 0, style: BorderStyle.none),
                          animationDuration: const Duration(milliseconds: 100),
                        ),
                        // : const SizedBox(width: 0),
                        Container(
                          width: 72.w,
                          height: 86.h,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Image.network(
                            product.mainImage?['imageUrl'] ??
                                "https://res.cloudinary.com/di6nk1mov/image/upload/v1716717635/ghrl7l0nn2ew3cbg85n6.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 14,
                              color: KzlyColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        RatingBar.builder(
                          itemSize: 16,
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
                          unratedColor: KzlyColors.white,
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "EGP ${product.price}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 12,
                            color: KzlyColors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                viewMode == true
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Count',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: KzlyColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            '3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: KzlyColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const ShapeDecoration(
                                  color: KzlyColors.red,
                                  shape: OvalBorder(),
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'Received',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: KzlyColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton.filled(
                            onPressed: onMinus,
                            icon: const Icon(
                              Icons.remove,
                              color: KzlyColors.primary,
                            ),
                            style: const ButtonStyle(
                                visualDensity: VisualDensity.compact,
                                backgroundColor:
                                    WidgetStatePropertyAll(KzlyColors.secondry)),
                            iconSize: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "$count",
                              style: const TextStyle(color: KzlyColors.white),
                            ),
                          ),
                          IconButton.filled(
                            onPressed: onAdd,
                            icon: const Icon(
                              Icons.add,
                              color: KzlyColors.primary,
                            ),
                            style: const ButtonStyle(
                                visualDensity: VisualDensity.compact,
                                backgroundColor:
                                    WidgetStatePropertyAll(KzlyColors.secondry)),
                            iconSize: 18,
                          ),
                        ],
                      ) 
              ],
            ),
          ],
        ),
      ),
    );
  }
}
