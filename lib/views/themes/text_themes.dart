import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextThemes {
  static TextStyle label = TextStyle(
    color: KzlyColors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle subtitle = TextStyle(
    color: KzlyColors.subtitle,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle price = TextStyle(
    color: KzlyColors.primary,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
  );

  // Add more text styles as needed

  // Example usage:
  // Text('Hello', style: TextThemes.headline),
}
