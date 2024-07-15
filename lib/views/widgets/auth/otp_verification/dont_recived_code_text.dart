import 'package:flowers_store/controllers/auth/verified_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DontRecivedCodeText extends StatelessWidget {
  const DontRecivedCodeText({super.key, required this.onTapResend});
  final Function()? onTapResend;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyCodeControllerImp>(builder: (controller) {
      return Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: "Don't received code?",
              style: TextStyle(
                  color: KzlyColors.primaryText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: "\tResend",
              style: TextStyle(
                  color: KzlyColors.purple,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700),
              recognizer: TapGestureRecognizer()..onTap = onTapResend,
            ),
          ]),
        ),
      );
    });
  }
}
