import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A class that defines different button themes.
class ButtonThemes {
  /// The primary button style.
  static ButtonStyle primary = const ButtonStyle(
      fixedSize: WidgetStatePropertyAll(Size.fromHeight(48)),
      backgroundColor: WidgetStatePropertyAll(KzlyColors.primary),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)))));

  /// The secondary button style.
  static ButtonStyle secondary = const ButtonStyle(
      textStyle:
          WidgetStatePropertyAll(TextStyle(color: KzlyColors.primary, fontSize: 16)),
      fixedSize: WidgetStatePropertyAll(Size.fromHeight(48)),
      side: WidgetStatePropertyAll(BorderSide(color: KzlyColors.primary, width: 1)),
      backgroundColor: WidgetStatePropertyAll(KzlyColors.white),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)))));

  /// The icon button style.
  static ButtonStyle outlineIconButton = IconButton.styleFrom(
    //padding: EdgeInsets.zero,
    backgroundColor: KzlyColors.white,
    fixedSize: Size.fromHeight(48.h),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
