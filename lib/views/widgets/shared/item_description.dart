import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDesc extends StatelessWidget {
  const ItemDesc({
    super.key,
    required this.des,
  });
  final String des;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Opacity(
        opacity: .4,
        child: Text(
          des,
          style: TextStyle(fontSize: 12.sp),
        ),
      ),
    );
  }
}
