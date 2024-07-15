import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/shared/about_textformfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';

class SupplierEditInformmation extends StatelessWidget {
  const SupplierEditInformmation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          Text(
            "Description",
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: KzlyColors.black),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12),
            child: AboutTextformfiled(
              hint: "Write about your self as a florist...",
              suffixIcon: Icon(SolarIconsOutline.pen, color: KzlyColors.black),
            ),
          ),
        ])));
  }
}
