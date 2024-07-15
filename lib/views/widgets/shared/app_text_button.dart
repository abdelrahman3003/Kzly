import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@Deprecated('Use FilledButton with ButtonThemes instead')
class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? buttonHeight;
  final double? buttonWidth;
  final Color? borderColor;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.buttonHeight,
      this.buttonWidth,
      required this.buttonText,
      required this.textStyle,
      required this.onPressed,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? KzlyColors.purple, width: 1),
              borderRadius: BorderRadius.circular(borderRadius ?? 4.0.h))),
          backgroundColor:
              WidgetStatePropertyAll(backgroundColor ?? KzlyColors.purple),
          fixedSize: WidgetStateProperty.all(
              Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 50.h))),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
