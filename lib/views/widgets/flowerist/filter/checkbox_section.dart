import 'package:flowers_store/controllers/filter_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckBoxSection extends StatelessWidget {
  const CheckBoxSection({super.key, required this.title, required this.value});
  final String title;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterControllerImp>(builder: (controller) {
      return Row(
        children: [
          Checkbox(
            activeColor: KzlyColors.primary,
            value: value,
            onChanged: (value) {
              controller.check(title, value!);
            },
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    });
  }
}
