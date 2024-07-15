import 'package:flowers_store/controllers/auth/signup_controller.dart';

import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/pages/auth/signup/signup_view_body.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpScreenControllerImp());
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
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
        body: GetBuilder<SignUpScreenControllerImp>(builder: (controller) {
          return const SignupViewBody();
        }));
  }
}
