import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';

class SupplierAddOffers extends StatelessWidget {
  const SupplierAddOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "We need to know your offers !",
            style: TextStyle(
                color: KzlyColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp),
          ),
          SizedBox(
            height: 16.h,
          ),
          Image.asset("assets/images/transfer_files.png"),
          SizedBox(
            height: 48.h,
          ),
          FilledButton.icon(
              style: ButtonThemes.primary
                  .copyWith(fixedSize: WidgetStatePropertyAll(Size(Get.width, 48))),
              onPressed: () {},
              icon: const Icon(
                SolarIconsOutline.downloadSquare,
                size: 22,
                color: KzlyColors.white,
              ),
              label: Text(
                "Download our template",
                style: TextStyle(
                    color: KzlyColors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700),
              )),
          SizedBox(
            height: 16.h,
          ),
          FilledButton.icon(
              style: ButtonThemes.secondary
                  .copyWith(fixedSize: WidgetStatePropertyAll(Size(Get.width, 48))),
              onPressed: () {},
              icon: const Icon(
                SolarIconsOutline.uploadSquare,
                size: 22,
                color: KzlyColors.white,
              ),
              label: Text(
                "Upload your excel sheet",
                style: TextStyle(
                    color: KzlyColors.primary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700),
              ))
        ],
      ),
    );
  }
}
