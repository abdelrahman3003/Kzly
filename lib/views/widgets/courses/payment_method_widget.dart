import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 57.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: KzlyColors.white,
        borderRadius: BorderRadius.circular(39),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/icons/payment-card.svg",
            width: 16.w,
            height: 16.h,
            color: KzlyColors.primary,
          ),
          SizedBox(
            width: 7.h,
          ),
          Expanded(
              child: Text(
            "XXXXXX-XXXXXXX-XXXXXXX",
            style: TextStyle(
                color: KzlyColors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
          ))
        ],
      ),
    );
  }
}
