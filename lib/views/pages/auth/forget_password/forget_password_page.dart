import 'package:flowers_store/controllers/auth/forget_password_controllers/forget_password_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/function/validation.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/auth/forget_password/remember_password_text.dart';
import 'package:flowers_store/views/widgets/shared/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ForgetPasswordScreenControllerImp());
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
          child: Form(
            key: controller.formKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Forgot Password?",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      color: const Color.fromRGBO(30, 35, 44, 1))),
              SizedBox(height: 4.h),
              Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: const Color.fromRGBO(131, 145, 161, 1))),
              SizedBox(height: 32.h),
              const Text("\tEmail",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: KzlyColors.textColor)),
              SizedBox(height: 8.h),
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return FormValidator.email(value);
                },
                decoration: InputDecoration(
                    hintText: "Enter your email",
                    prefixIcon: AssetIcon(
                      assetPath: Assets.icons.email,
                      color: KzlyColors.secondryText,
                    )),
              ),
              SizedBox(height: 120.h),
              GetBuilder<ForgetPasswordScreenControllerImp>(
                builder: (controller) => FilledButton(
                    onPressed: () {
                      controller.getUserId();
                    },
                    style: ButtonThemes.primary.copyWith(
                        fixedSize: WidgetStateProperty.all(Size(Get.width, 48))),
                    child: controller.statusRequest == StatusRequest.loading
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: KzlyColors.white,
                              ),
                            ),
                          )
                        : Text(
                            'Send code',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: KzlyColors.white),
                          )),
              ),
              SizedBox(height: 32.h),
              const RememberPasswordText()
            ]),
          ),
        )));
  }
}
