import 'package:flowers_store/data/source/remote/auth/forget_passowrd_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordScreenController extends GetxController {
  getUserId();
}

class ForgetPasswordScreenControllerImp extends ForgetPasswordScreenController {
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  getUserId() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgetPasswordData.getUserId(emailController.text);
      if (response["status"] == "success") {
        await forgetPasswordData.sendresetPasswordOtp(
          userId: response["id"],
          otpType: "RESET_PASSWORD",
        );
        print("===============${response['id']}");
        Get.toNamed(kOtpVerificationPage,
            arguments: {"id": response["id"], "isForgetPassword": true});

        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
        Get.showSnackbar(
          GetSnackBar(
            message: response["status"].toString().capitalizeFirst,
            duration: const Duration(seconds: 5),
          ),
        );
      }
      update();
    }
  }
}
