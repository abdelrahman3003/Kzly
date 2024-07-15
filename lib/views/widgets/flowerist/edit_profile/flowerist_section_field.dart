import 'package:chips_choice/chips_choice.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloweristSectionField extends StatelessWidget {
  const FloweristSectionField(
      {super.key,
      required this.selectedOptions,
      required this.options,
      required this.onChanged});
  final List<String> selectedOptions;
  final List<String> options;
  final void Function(List<String>) onChanged;
  @override
  Widget build(BuildContext context) {
    return ChipsChoice<String>.multiple(
      value: selectedOptions,
      onChanged: onChanged,
      choiceItems: C2Choice.listFrom<String, String>(
          source: options,
          value: (i, v) => v,
          label: (i, v) => v,
          tooltip: (i, v) => v),
      choiceStyle: C2ChipStyle.filled(
        borderWidth: 100,
        borderRadius: BorderRadius.circular(30),
        selectedStyle: C2ChipStyle(
            backgroundColor: KzlyColors.primary,
            foregroundStyle: TextStyle(
              color: KzlyColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            )),
        foregroundStyle: TextStyle(
          color: KzlyColors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        color: KzlyColors.greyColor,
      ),
      choiceCheckmark: false,
      textDirection: TextDirection.ltr,
      wrapped: true,
    );
  }
}
