import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../herlpers/constant/assets.dart';
import '../../../herlpers/constant/routsApp.dart';
import '../../widgets/custom_appbar_flowrist.dart';

class PendingRequest extends StatelessWidget {
  const PendingRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: const CustomAppbarFlowrist(title: "Pending  Request"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 170.h,
                width: 170.w,
                child: Image.asset(Assets.images.aproval2.path),
              ),
              Text(
                "We'll verify your data for approval",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Text(
                  "Your data will be verified within the next 24 hours to confirm your data and accept your request you can continue to garden.",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0XFFF8E8E8),
                    borderRadius: BorderRadius.circular(8.h)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "In case of insufficient data, the account will be suspended",
                        style:
                            TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SvgPicture.asset(IconAsset.warnign, width: 24.w, height: 24.h),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: FilledButton(
                    child: Text("Continue to garden",
                        style:
                            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
                    style: ButtonThemes.primary.copyWith(
                        fixedSize: WidgetStatePropertyAll(Size(Get.width, 48))),
                    onPressed: () {
                      Get.toNamed(kRequestApproval);
                    },
                  )),
            ],
          ),
        )
        //
        );
  }
}
