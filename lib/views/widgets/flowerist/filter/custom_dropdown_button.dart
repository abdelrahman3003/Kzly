import 'package:flowers_store/controllers/filter_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDropdownButton extends GetView<FilterControllerImp> {
  const CustomDropdownButton( {
    super.key,
    required this.items,
    this.onChanged,
    required this.hinttext,
    required this.value,
     this.prefixIcon,
  });
  final List<String> items;
  final void Function(String?)? onChanged;
  final String hinttext;
  final String value;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      
        // value: dropdownvalue,
        decoration:  InputDecoration(
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(),
        ),
        value: value.isNotEmpty ? value : null, // guard it with null if empty
        hint: Text(
          hinttext,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: KzlyColors.secondryText,
          ),
        ),
        isExpanded: true,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: KzlyColors.secondryText,
        ),
        iconSize: 30,
        items: items.map((String items) {
          return DropdownMenuItem(value: items, child: Text(items));
        }).toList(),
        onChanged: onChanged);
  }
}
