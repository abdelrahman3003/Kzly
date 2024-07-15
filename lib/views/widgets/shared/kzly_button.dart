import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KzlyButton extends StatelessWidget {
  const KzlyButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
      ),
      onPressed: onPressed,
      color: KzlyColors.primary,
      height: 41.h,
      minWidth: 162.w,
      child: Text(
        text,
        style: TextStyle(fontSize: 14.sp, color: Colors.white),
      ),
    );
  }
}
