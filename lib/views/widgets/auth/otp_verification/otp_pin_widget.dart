import 'package:flowers_store/controllers/auth/verified_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpPinWidget extends GetView<VerifyCodeControllerImp> {
  final Function(String)? onCompleted;
  const OtpPinWidget({super.key, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      autofocus: true,
      controller: controller.onCompleteController,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      defaultPinTheme: PinTheme(
          width: 50,
          height: 50,
          
          textStyle: const TextStyle(
              color: Color.fromRGBO(27, 4, 41, 1),
              fontSize: 22,
              fontWeight: FontWeight.w700),
          decoration: BoxDecoration(
              color: KzlyColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black))),
      onCompleted: onCompleted,
      focusedPinTheme: PinTheme(
              width: 50,
              height: 50,
              textStyle: const TextStyle(
                  color: Color.fromRGBO(27, 4, 41, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
              decoration: BoxDecoration(
                  color: KzlyColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)))
          .copyWith(
              decoration: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: const TextStyle(
                          color: Color.fromRGBO(27, 4, 41, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                      decoration: BoxDecoration(
                          color: KzlyColors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: KzlyColors.purple)))
                  .decoration!
                  .copyWith(border: Border.all(color: KzlyColors.purple))),
    );
  }
}
