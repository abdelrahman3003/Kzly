import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalDividerWithTextinMiddle extends StatelessWidget {
  final String text;
  final Color? dividerColor;
  final Color? textColor;
  const HorizontalDividerWithTextinMiddle(
      {super.key, required this.text, this.dividerColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
            margin: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Divider(
              color: dividerColor ?? Colors.black,
              height: 36,
            )),
      ),
      Text(text,
          style: TextStyle(
              color: textColor??const Color.fromRGBO(103, 96, 108, 1),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600)),
      Expanded(
        child: Container(
            margin: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Divider(
              color: dividerColor ?? Colors.black,
              height: 36,
            )),
      ),
    ]);
  }
}
