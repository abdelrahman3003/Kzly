import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/shared/enums/enum.dart';
import 'package:flowers_store/views/widgets/shared/stars_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyOrdersCards extends StatelessWidget {
  final Map<String, dynamic> productdata;
  const MyOrdersCards({super.key, required this.productdata});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: KzlyColors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 72.w,
                  height: 86.h,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(productdata["image"]))),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productdata["name"].toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14,
                            color: KzlyColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.h),
                      StarRating(
                        starSize: 10,
                        itemCount: 5,
                        rating: double.parse(productdata["stars"].toString()),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "EGP ${productdata["price"]}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 12,
                          color: KzlyColors.primary,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 12.h, bottom: 5.h),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: productdata["status"] ==
                          KzlyOrdersSections.done.name.capitalizeFirst
                      ? KzlyColors.lightgreenColor
                      : productdata["status"] ==
                              KzlyOrdersSections.pending.name.capitalizeFirst
                          ? KzlyColors.lightorangeColor
                          : KzlyColors.lightredColor,
                ),
                child: Text(
                  productdata["status"],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: productdata["status"] ==
                              KzlyOrdersSections.done.name.capitalizeFirst
                          ? KzlyColors.greenColor
                          : productdata["status"] ==
                                  KzlyOrdersSections.pending.name.capitalizeFirst
                              ? KzlyColors.orangeColor
                              : KzlyColors.redColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                productdata["days"],
                style: TextStyle(
                    color: KzlyColors.greyColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Count",
                style: TextStyle(
                    color: KzlyColors.purpleBlack,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                productdata["countNo"].toString(),
                style: TextStyle(
                    color: KzlyColors.purple,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
    );
  }
}
