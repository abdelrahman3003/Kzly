import 'package:flowers_store/herlpers/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


@Deprecated("User the default appbar instead")
class CustomAppbarFlowrist extends StatelessWidget {
  const CustomAppbarFlowrist(
      {super.key, required this.title, this.isSearch = false});
  final String title;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(IconAsset.back, width: 20.w, height: 20.h)),
    );
  }
}
