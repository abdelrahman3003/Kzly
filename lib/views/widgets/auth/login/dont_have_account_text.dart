import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "Don't have an account?",
            style: TextStyle(
                color: KzlyColors.primaryText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: "\tRegister now",
            style: TextStyle(
                color: KzlyColors.purple,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.offNamed(kSignupView),
          ),
        ]),
      ),
    );
  }
}
