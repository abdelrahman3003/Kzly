import 'dart:developer';
import 'package:flowers_store/data/source/remote/auth/create_new_password_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CreateNewPasswordScreenController extends GetxController {
  showPassword({bool newPassword = false});

  Future<void> resetPassword();
}

class CreateNewPasswordScreenControllerImp
    extends CreateNewPasswordScreenController {
  CreateNewPasswordData createNewPasswordData = CreateNewPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPaswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isNewPassword = true;
  bool isConfirmPassword = true;
  late dynamic resetToken;

  @override
  showPassword({bool newPassword = false}) {
    if (newPassword) {
      isNewPassword = !isNewPassword;
      log("isNePassword:$isNewPassword");
    } else {
      isConfirmPassword = !isConfirmPassword;
      log("isConfirmPassword:$isConfirmPassword");
    }
    update();
  }

  @override
  resetPassword() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await createNewPasswordData.sendresetPasswordOtp(
          resetToken: resetToken, newpassword: newPasswordController.text);

      update();

      if (response["status"] == "success") {
        ///Here Make Response and return Data  bec. status code ==200
        log("success Data ====== : $response");
        Get.offAllNamed(kChangedPasswordPage);
      } else {
        ///Here Make Response and return Error Message bec. status code !=200
        log("Problem Error In The email or Url");
        Get.showSnackbar(
          GetSnackBar(
            message: response["status"].toString(),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
    update();
  }

  @override
  void onInit() {
    resetToken = Get.arguments['response'];
    super.onInit();
  }
}
