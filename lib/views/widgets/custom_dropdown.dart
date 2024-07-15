import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomDropdown(
        hintText: "sections",
        items: const ["abdo", "kllkldsk", "jhjkdhjkfh"],
        decoration: CustomDropdownDecoration(
          closedFillColor: KzlyColors.white,
          expandedFillColor: KzlyColors.white,
          closedBorder: Border.all(
            color: KzlyColors.black,
            width: 1,
          ),
          closedBorderRadius: BorderRadius.circular(10),
          expandedBorder: Border.all(
            width: 1,
          ),
          expandedBorderRadius: BorderRadius.circular(5),
          closedSuffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: KzlyColors.black,
          ),
          expandedSuffixIcon: const Icon(
            Icons.keyboard_arrow_up_rounded,
            color: KzlyColors.black,
          ),
          closedErrorBorder: Border.all(color: KzlyColors.black, width: 1),
          closedErrorBorderRadius: BorderRadius.circular(5),
          errorStyle: TextStyle(color: KzlyColors.red, fontSize: 16.sp),
        ),
        excludeSelected: true,
        onChanged: (String) {},
      ),
    );
  }
}
