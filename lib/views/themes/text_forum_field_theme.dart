import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KzlyTextFormFieldTheme {
  static InputDecorationTheme mainTheme = InputDecorationTheme(
    isDense: true,
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    errorMaxLines: 1,
    contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: KzlyColors.primary, width: 1.3.h),
        borderRadius: BorderRadius.circular(4.0.h)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: KzlyColors.secondryText, width: 1.3.h),
        borderRadius: BorderRadius.circular(4.h)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.3.h),
        borderRadius: BorderRadius.circular(4.0.h)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: KzlyColors.primary, width: 1.3.h),
        borderRadius: BorderRadius.circular(4.0.h)),
    hintStyle: TextStyle(color: KzlyColors.secondryText, fontSize: 14.sp),
  );

  static InputDecorationTheme myTheme = InputDecorationTheme(
    isDense: true,
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    errorMaxLines: 1,
    contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.yellow, width: 1.3.h),
        borderRadius: BorderRadius.circular(4.0.h)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: KzlyColors.secondryText, width: 1.3.h),
        borderRadius: BorderRadius.circular(4.h)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.3.h),
        borderRadius: BorderRadius.circular(4.0.h)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: KzlyColors.primary, width: 1.3.h),
        borderRadius: BorderRadius.circular(4.0.h)),
    hintStyle: TextStyle(color: KzlyColors.secondryText, fontSize: 14.sp),
  );
}
