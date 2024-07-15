import 'package:flowers_store/herlpers/constant/assets.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangedPasswordPage extends StatelessWidget {
  const ChangedPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(IconAsset.resetPasswordImage),
              Text("Password Changed!",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      color: const Color.fromRGBO(30, 35, 44, 1))),
              SizedBox(height: 5.h),
              Text("Your password has been changed\nsuccessfully.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: const Color.fromRGBO(131, 145, 161, 1))),
              SizedBox(height: 16.h),
              FilledButton(
                  onPressed: () => Get.offNamed(kLoginPage, arguments: true),
                  style: ButtonThemes.primary.copyWith(
                      fixedSize: WidgetStateProperty.all(Size(Get.width, 48))),
                  child: Text(
                    'Back to login',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: KzlyColors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
