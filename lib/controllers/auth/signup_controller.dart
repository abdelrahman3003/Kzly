import 'package:flowers_store/data/source/remote/auth/postdata_signup.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpScreenController extends GetxController {
  signup();
  showPassword();
  showConfirmPassword();
}

class SignUpScreenControllerImp extends SignUpScreenController {
  PostDataSignup postDataSignup = PostDataSignup(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController =
      TextEditingController(text: "abdo");
  final TextEditingController phoneController =
      TextEditingController(text: "01032974411");
  final TextEditingController emailController =
      TextEditingController(text: "abdelrahmantemsah30@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "123456");
  final TextEditingController confirmPasswordController =
      TextEditingController(text: "123456");
  final TextEditingController genderController = TextEditingController(text: "male");
  bool isPassword = true;
  bool isconfirmPassword = true;
  @override
  showPassword() {
    isPassword = !isPassword;
    update();
  }

  @override
  showConfirmPassword() {
    isconfirmPassword = !isconfirmPassword;
    update();
  }

  @override
  signup() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await postDataSignup.postDataSignup(
        fullNameController.text,
        phoneController.text,
        emailController.text,
        passwordController.text,
      );

      if (response["status"] == "success") {
        statusRequest = StatusRequest.success;
        Get.offAllNamed(kOtpVerificationPage,
                arguments: {'id': response['user']['_id']})
            ?.then((value) => Get.showSnackbar(const GetSnackBar(
                title: "success",
                message: "Your account has been created successfully",
                duration: Duration(seconds: 5),
                backgroundColor: KzlyColors.green)));
      } else {
        statusRequest = StatusRequest.failure;
        update();
        Get.showSnackbar(
          GetSnackBar(
            message: response["status"].toString().capitalizeFirst,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }

    update();
  }
}
