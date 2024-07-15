import 'package:flowers_store/data/source/remote/auth/login_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../herlpers/constant/colors.dart';
import '../../herlpers/service/serviece.dart';

abstract class LoginScreenController extends GetxController {
  showPassword();
  login();
}

class LoginScreenControllerImp extends LoginScreenController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController(text: "abdelrahmantemsah30@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "123456");
  bool isPassword = true;
  LoginData loginData = LoginData(Get.find());
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  @override
  showPassword() {
    isPassword = !isPassword;
    update();
  }

  @override
  login() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await loginData.login(emailController.text, passwordController.text);
      if (response["status"] == "success") {
        appServices.sharedPreferences
            .setString("accessToken", response['accessToken']);
        appServices.sharedPreferences.setString("step", "2");
        Get.offAllNamed(kBottomNavigationScreen)?.then((value) => Get.showSnackbar(
            const GetSnackBar(
                title: "Success",
                message: "Your account has been created successfully",
                duration: Duration(seconds: 5),
                backgroundColor: KzlyColors.green)));
      } else {
        print("==========================================");
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
    update();
  }
}
