import 'dart:developer';

import 'package:flowers_store/data/source/remote/auth/postdata_signup.dart';
import 'package:flowers_store/data/source/remote/auth/verify_Code_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  confirmOTP();
  resend();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  GetVerifyCode getVerifyCode = GetVerifyCode(Get.find());
  PostDataSignup postDataSignup = PostDataSignup(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late String id;
  late bool isForgetPasword;
  TextEditingController onCompleteController = TextEditingController();
  @override
  confirmOTP() async {
    statusRequest = StatusRequest.loading;
    update();
    if (isForgetPasword) {
      var response = await getVerifyCode.verifyResetPassOtp(
          userId: id, otpType: "RESET_PASSWORD", otp: onCompleteController.text);
      if (response["status"] == "success") {
        Get.offAllNamed(kCreateNewPasswordPage,
            arguments: {"response": response["token"]});
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "error",
          middleText: "Verify code failed",
        );
      }
      update();
    } else {
      var response =
          await getVerifyCode.resendVerifyCode(id, onCompleteController.text);

      if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "error",
          middleText: "Verify code failed",
        );
      } else {
        Get.offAllNamed(kLoginPage, arguments: true);
      }
      update();
    }
  }

  @override
  void onInit() {
    id = Get.arguments['id'];
    isForgetPasword = Get.arguments['isForgetPassword'] ?? false;
    log(isForgetPasword.toString());
    super.onInit();
  }

  @override
  resend({bool isForgetPassword = false}) async {
    await postDataSignup.gettVerifyCode(
        id, isForgetPassword ? "RESET_PASSWORD" : "Verify_Account");
    Get.rawSnackbar(
        backgroundColor: KzlyColors.primary,
        title: "",
        messageText: const Text("Check your email to new Verifycode",
            style: TextStyle(color: KzlyColors.white)));
    update();
  }
}
