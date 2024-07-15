import 'dart:developer';

import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/function/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../controllers/auth/login_controller.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../herlpers/constant/assets.dart';
import '../../../../herlpers/constant/colors.dart';
import '../../../../herlpers/constant/routsApp.dart';
import '../../../../herlpers/localization/localization.dart';
import '../../../themes/button_themes.dart';
import '../../../widgets/auth/login/dont_have_account_text.dart';
import '../../../widgets/auth/login/horizontal_divider_with_text_in_middle.dart';
import '../../../widgets/auth/login/social_media_widget.dart';
import '../../../widgets/shared/asset_icon.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GetBuilder<LoginScreenControllerImp>(
              builder: (controller) {
                log("build");
                return Form(
                  key: controller.formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.tr('login_text')!,
                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.w700)),
                        SizedBox(height: 80.h),
                        const Text("\tEmail",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: KzlyColors.textColor)),
                        SizedBox(height: 8.h),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Enter your email",
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
                              border: const OutlineInputBorder(),
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
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(kForgetPasswordPage);
                            },
                            child: Text("Forget Password ?",
                                style: TextStyle(
                                    color: KzlyColors.purple,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                        SizedBox(height: 32.h),
                        FilledButton(
                            onPressed: () {
                              controller.login();
                            },
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
                                    'Log in',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  )),
                        SizedBox(height: 8.h),
                        const HorizontalDividerWithTextinMiddle(
                          text: "Or Login with",
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
                        const DontHaveAccountText()
                      ]),
                );
              },
            )));
  }
}
