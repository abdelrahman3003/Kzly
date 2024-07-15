import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@Deprecated("Use TextFormFiled instead with custom themes")
class FlowristFiled extends StatelessWidget {
  const FlowristFiled({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}
