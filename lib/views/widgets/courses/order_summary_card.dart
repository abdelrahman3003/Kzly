import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/widgets/shared/stars_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: KzlyColors.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 16,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///Right Sized
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage("assets/images/flowrist_image.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),

          Expanded(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Floristry Diploma",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: KzlyColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  StarRating(
                    starSize: 10.w,
                    rating: 4,
                  )
                ]),
          ),

          ///Left Side
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 4.w,
                    backgroundColor: const Color.fromRGBO(67, 184, 38, 1),
                  ),
                  SizedBox(width: 4.w),
                  Text("Online",
                      style: TextStyle(
                          color: const Color.fromRGBO(67, 184, 38, 1),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700))
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Text("EGP 1550",
                  style: TextStyle(
                      color: KzlyColors.primary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700))
            ],
          )
        ],
      ),
    );
  }
}
