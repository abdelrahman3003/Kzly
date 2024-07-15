import 'package:flowers_store/controllers/auth/forget_password_controllers/create_new_password_controller.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/function/validation.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateNewPasswordScreenControllerImp());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 65.h),
          child: GetBuilder<CreateNewPasswordScreenControllerImp>(
              builder: (controller) => Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Create new password",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                                color: const Color.fromRGBO(30, 35, 44, 1))),
                        SizedBox(height: 4.h),
                        Text(
                            "Your new password must be unique from those previously used.",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: const Color.fromRGBO(131, 145, 161, 1))),
                        SizedBox(height: 32.h),
                        const Text("\tNew password",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: KzlyColors.textColor)),
                        SizedBox(height: 8.h),
                        TextFormField(
                          controller: controller.newPasswordController,
                          obscureText: controller.isNewPassword,
                          validator: (value) {
                            return FormValidator.password(value);
                          },
                          decoration: InputDecoration(
                              hintText: "Enter your password",
                              prefixIcon: const Icon(SolarIconsOutline.lockPassword,
                                  size: 24, color: KzlyColors.greyColor),
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    controller.showPassword(newPassword: true),
                                icon: controller.isNewPassword
                                    ? const Icon(SolarIconsOutline.eye,
                                        size: 24, color: KzlyColors.greyColor)
                                    : const Icon(SolarIconsOutline.eyeClosed,
                                        size: 24, color: KzlyColors.greyColor),
                              )),
                        ),
                        SizedBox(height: 8.h),
                        const Text("\tConfirm password",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: KzlyColors.textColor)),
                        SizedBox(height: 8.h),
                        TextFormField(
                          controller: controller.confirmPaswordController,
                          obscureText: controller.isConfirmPassword,
                          validator: (value) {
                            return FormValidator.confirmPassword(
                                value, controller.newPasswordController.text);
                          },
                          decoration: InputDecoration(
                              hintText: "Confirm your password",
                              prefixIcon: const Icon(SolarIconsOutline.lockPassword,
                                  size: 24, color: KzlyColors.greyColor),
                              suffixIcon: IconButton(
                                onPressed: () => controller.showPassword(),
                                icon: controller.isConfirmPassword
                                    ? const Icon(SolarIconsOutline.eye,
                                        size: 24, color: KzlyColors.greyColor)
                                    : const Icon(SolarIconsOutline.eyeClosed,
                                        size: 24, color: KzlyColors.greyColor),
                              )),
                        ),
                        SizedBox(height: 35.h),
                        FilledButton(
                            onPressed: () async => controller.resetPassword(),
                            style: ButtonThemes.primary.copyWith(
                                fixedSize:
                                    WidgetStateProperty.all(Size(Get.width, 48))),
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
                                    'Reset Password',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: KzlyColors.white),
                                  )),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
