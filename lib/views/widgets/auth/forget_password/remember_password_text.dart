import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RememberPasswordText extends StatelessWidget {
  const RememberPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "Remember Password?",
            style: TextStyle(
                color: KzlyColors.primaryText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: "\tLogin",
            style: TextStyle(
                color: KzlyColors.purple,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
            recognizer: TapGestureRecognizer()
              ..onTap = ()=>
                Get.back()
          ),
        ]),
      ),
    );
  }
}
