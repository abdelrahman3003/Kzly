import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enableBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? textInputType;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final String? svgPrefixIcon;
  final String? svgsvgSuffixIcon;
  final Function()? onTapsvgSuffixIcon;
  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enableBorder,
      this.inputTextStyle,
      this.hintStyle,
      required this.hintText,
      this.isObscureText,
      this.backgroundColor,
      this.controller,
      required this.validator,
      this.textInputType,
      this.onTap,
      this.onSaved,
      this.svgPrefixIcon,
      this.svgsvgSuffixIcon,
      this.onTapsvgSuffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onTap: onTap,
      controller: controller,

      keyboardType: textInputType,
      decoration: InputDecoration(
        errorMaxLines: 1,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(color: KzlyColors.primary, width: 1.3.h),
                borderRadius: BorderRadius.circular(4.0)),
        enabledBorder: enableBorder ??
            OutlineInputBorder(
                borderSide:
                    BorderSide(color: KzlyColors.secondryText, width: 1.3.h),
                borderRadius: BorderRadius.circular(4)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.3.w),
            borderRadius: BorderRadius.circular(4.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: KzlyColors.primary, width: 1.3.w),
            borderRadius: BorderRadius.circular(4.0)),
        hintStyle: hintStyle ??
            TextStyle(color: KzlyColors.secondryText, fontSize: 14.sp),
        hintText: hintText,
        suffixIcon: svgsvgSuffixIcon != null
            ? GestureDetector(
                onTap: onTapsvgSuffixIcon,
                child: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 16.w),
                    child: SvgPicture.asset(
                      svgsvgSuffixIcon!,
                      height: 16.h,
                      width: 16.w,
                    )),
              )
            : null,
        prefixIcon: svgPrefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(left: 12.w, right: 16.w),
                child: SvgPicture.asset(
                  svgPrefixIcon!,
                  height: 16.h,
                  width: 16.w,
                ),
              )
            : null,
      ),
      obscureText: isObscureText ?? false,
      //This for text Style
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
      validator: (value) => validator(value),
    );
  }
}
