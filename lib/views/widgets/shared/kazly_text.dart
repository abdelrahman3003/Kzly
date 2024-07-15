import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KzlyText extends StatelessWidget {
  const KzlyText({super.key, required this.text, this.color = Colors.black});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
