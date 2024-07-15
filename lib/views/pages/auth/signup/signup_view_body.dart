import 'package:flowers_store/controllers/auth/signup_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/assets.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/auth/login/horizontal_divider_with_text_in_middle.dart';
import 'package:flowers_store/views/widgets/auth/login/social_media_widget.dart';
import 'package:flowers_store/views/widgets/auth/sign_up/already_have_account_text.dart';
import 'package:flowers_store/views/widgets/shared/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../herlpers/function/validation.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GetBuilder<SignUpScreenControllerImp>(
              builder: (controller) => Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello! Register to get\nStarted",
                        style:
                            TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
                    SizedBox(height: 16.h),
                    const Text("Full Name",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: KzlyColors.textColor)),
                    SizedBox(height: 8.h),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        prefixIcon: AssetIcon(
                          assetPath: Assets.icons.person,
                          color: KzlyColors.secondryText,
                        ),
                      ),
                      controller: controller.fullNameController,
                      validator: (value) {
                        return FormValidator.name(value);
                      },
                    ),
                    SizedBox(height: 8.h),
                    const Text("\tPhone number",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: KzlyColors.textColor)),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Phone",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.phone,
                            color: KzlyColors.secondryText,
                          )),
                      validator: (value) {
                        return FormValidator.phone(value);
                      },
                    ),
                    SizedBox(height: 8.h),
                    const Text("\tEmail",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: KzlyColors.textColor)),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.email,
                            color: KzlyColors.secondryText,
                          )),
                      validator: (value) {
                        return FormValidator.email(value);
                      },
                    ),
                    SizedBox(height: 8.h),
                    const Text("\tPassword",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: KzlyColors.textColor)),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.passwordController,
                      obscureText: controller.isPassword,
                      decoration: InputDecoration(
                          hintText: "Enter your password",
                          prefixIcon: const Icon(SolarIconsOutline.password,
                              size: 24, color: KzlyColors.greyColor),
                          suffixIcon: IconButton(
                            onPressed: () => controller.showPassword(),
                            icon: controller.isPassword
                                ? const Icon(SolarIconsOutline.eye,
                                    size: 24, color: KzlyColors.greyColor)
                                : const Icon(SolarIconsOutline.eyeClosed,
                                    size: 24, color: KzlyColors.greyColor),
                          )),
                      validator: (value) {
                        return FormValidator.password(value);
                      },
                    ),
                    SizedBox(height: 8.h),
                    const Text("\tConfirm Password",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: KzlyColors.textColor)),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.confirmPasswordController,
                      obscureText: controller.isconfirmPassword,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: const Icon(SolarIconsOutline.password,
                              size: 24, color: KzlyColors.greyColor),
                          suffixIcon: IconButton(
                            onPressed: () => controller.showConfirmPassword(),
                            icon: controller.isconfirmPassword
                                ? const Icon(SolarIconsOutline.eye,
                                    size: 24, color: KzlyColors.greyColor)
                                : const Icon(SolarIconsOutline.eyeClosed,
                                    size: 24, color: KzlyColors.greyColor),
                          )),
                      validator: (value) {
                        return FormValidator.confirmPassword(
                            value, controller.passwordController.text);
                      },
                    ),
                    //  CustomDropdownButton(items: items, onChanged: onChanged, hinttext: hinttext, value: value),
                    SizedBox(height: 24.h),
                    FilledButton(
                      onPressed: () {
                        controller.signup();
                      },
                      style: ButtonThemes.primary.copyWith(
                          fixedSize: WidgetStatePropertyAll(Size(Get.width, 48.h))),
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
                              'Create Account',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ),
                    ),
                    SizedBox(height: 16.h),
                    const HorizontalDividerWithTextinMiddle(
                      text: 'Or Sign Up with',
                    ),
                    SizedBox(height: 16.h),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const SocialMediaWidget(
                        image: IconAsset.facebookIcon,
                      ),
                      SizedBox(width: 16.w),
                      const SocialMediaWidget(
                        image: IconAsset.googleIcon,
                      ),
                    ]),
                    SizedBox(height: 16.h),
                    const AlreadyHaveAccountText(),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            )));
  }
}
