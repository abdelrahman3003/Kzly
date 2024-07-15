import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../herlpers/constant/colors.dart';
import '../../../herlpers/constant/routsApp.dart';
import '../../widgets/shared/app_text_button.dart';
import '../../widgets/custom_appbar_flowrist.dart';

class RequestApproval extends StatelessWidget {
  const RequestApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: const CustomAppbarFlowrist(title: "Requset  Approval"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 170.h,
                width: 170.w,
                child: Image.asset(Assets.images.aproval1.path),
              ),
              Text(
                "Your request has been accepted",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Text(
                  "Your request has been accepted, and you can now operate as a florist in the application.",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: SizedBox(
                  height: 48.h,
                  child: AppTextButton(
                    buttonText: "Continue",
                    textStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                    onPressed: () {
                      Get.toNamed(kFlowristList);
                    },
                    backgroundColor: KzlyColors.primary,
                  ),
                ),
              ),
            ],
          ),
        )
        //
        );
  }
}
