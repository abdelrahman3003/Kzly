import 'package:flowers_store/herlpers/constant/assets.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/auth/login/horizontal_divider_with_text_in_middle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Image.asset(IconAsset.welcomeImage),
              SizedBox(height: 15.h),
              FilledButton(
                  onPressed: () {
                    Get.toNamed(kLoginPage);
                  },
                  style: ButtonThemes.primary.copyWith(
                      fixedSize: WidgetStateProperty.all(Size(Get.width, 48))),
                  child: Text("Log in",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ))),
              SizedBox(height: 10.h),
              const HorizontalDividerWithTextinMiddle(
                text: "Or Create Account",
              ),
              FilledButton(
                  onPressed: () => Get.toNamed(kSignupView, arguments: false),
                  style: ButtonThemes.secondary.copyWith(
                      fixedSize: WidgetStateProperty.all(Size(Get.width, 48))),
                  child: Text("Garden",
                      style: TextStyle(
                        color: KzlyColors.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ))),
              SizedBox(height: 10.h),
              FilledButton(
                  onPressed: () {
                    Get.toNamed(kFlowristRegistration);
                  },
                  style: ButtonThemes.secondary.copyWith(
                      fixedSize: WidgetStateProperty.all(Size(Get.width, 48))),
                  child: Text("Florist",
                      style: TextStyle(
                        color: KzlyColors.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
