import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentPrice extends StatelessWidget {
  const ContentPrice(
      {super.key, required this.title, required this.value, this.isMain});
  final String title;
  final String value;
  final bool? isMain;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, // Assuming the first key is "Subtotal" or "Total"
            style: isMain == null || isMain == false
                ? TextThemes.subtitle
                : TextThemes.label),
        Text(
          value,
          style: isMain == null || isMain == false
              ? TextThemes.price
              : TextThemes.price.copyWith(fontSize: 16.sp),
        ),
      ],
    );
  }
}
