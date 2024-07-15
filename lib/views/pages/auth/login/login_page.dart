import 'package:flowers_store/controllers/auth/login_controller.dart';

import 'package:flowers_store/herlpers/constant/colors.dart';

import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:flowers_store/views/pages/auth/login/login_page_body.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppServices appServices = Get.find();
    Get.put(LoginScreenControllerImp());

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                side: const BorderSide(color: KzlyColors.pink, width: 1),
                borderRadius: BorderRadius.circular(8.0))),
          ),
          onPressed: () {
            if (Get.arguments != null) {
              appServices.sharedPreferences.setString("step", "2");
              Get.offNamed(kWelcomePage);
            } else {
              Get.back();
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: KzlyColors.purpleBlack,
            size: 24,
          ),
        )),
        body: const LoginPageBody());
  }
}
