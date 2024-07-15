import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KzlyContent extends StatelessWidget {
  const KzlyContent(
      {super.key, required this.title, this.onPressed, this.trailing});
  final String title;
  final Widget? trailing;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        trailing ??
            TextButton(
                onPressed: onPressed,
                child: const Text(
                  "See all",
                  style: TextStyle(color: KzlyColors.primary),
                ))
      ],
    );
  }
}
