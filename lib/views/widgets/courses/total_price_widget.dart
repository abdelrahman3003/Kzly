import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total Price",
          style: TextStyle(
            color: KzlyColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "EGP 1800",
          style: TextStyle(
              color: KzlyColors.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
