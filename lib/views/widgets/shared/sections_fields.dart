import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SectionsFields extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool isSelected;
  const SectionsFields({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, 
        child: Container(
          margin: EdgeInsets.only(right: 12.w),
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          height: 32.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.h),
              color: isSelected ? KzlyColors.primary : Colors.white,
              border: Border.all(color: KzlyColors.primary)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: isSelected ? Colors.white : KzlyColors.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
    );
  }
}
