import 'package:flowers_store/controllers/auth/verified_controller.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/auth/otp_verification/dont_recived_code_text.dart';
import 'package:flowers_store/views/widgets/auth/otp_verification/otp_pin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OtpVerificationPage extends StatelessWidget {
  OtpVerificationPage({super.key});
  final arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: KzlyColors.pink, width: 1),
              borderRadius: BorderRadius.circular(8.0))),
        ),
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: KzlyColors.purpleBlack,
          size: 24,
        ),
      )),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("OTP Verification",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
            SizedBox(height: 4.h),
            Text("Enter the verification code we just sent on your email address..",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
            SizedBox(height: 48.h),
            //Here We Will put pin
            const Center(child: OtpPinWidget()),
            SizedBox(height: 125.h),

            GetBuilder<VerifyCodeControllerImp>(builder: (controller) {
              return FilledButton(
                  style: ButtonThemes.primary.copyWith(
                      fixedSize: WidgetStateProperty.all(Size(Get.width, 48))),
                  onPressed: () {
                    if (controller.statusRequest != StatusRequest.loading) {
                      controller.confirmOTP();
                    }
                  },
                  child: controller.statusRequest != StatusRequest.loading
                      ? Text("Verify",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ))
                      : const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: KzlyColors.white,
                            ),
                          ),
                        ));
            }),
            SizedBox(height: 32.h),
            DontRecivedCodeText(
              onTapResend: () {
                arguments["isForgetPassword"]
                    ? controller.resend(isForgetPassword: true)
                    : controller.resend();
              },
            ),
          ],
        ),
      )),
    );
  }
}
