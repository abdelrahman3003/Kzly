import 'package:flowers_store/controllers/profile/myprofile_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/function/validation.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/flowerist/edit_profile/edit_section.dart';
import 'package:flowers_store/views/widgets/shared/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePasswordDailog extends StatelessWidget {
  const ChangePasswordDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileControllerImp>(builder: (controller) {
      return Form(
        key: controller.formKeychangePassword,
        child: Dialog(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 24),
                  child: Center(
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                EditSection(
                    tilte: "Current Password",
                    hint: "Enter current password",
                    icon: Assets.icons.password,
                    obscureText: controller.isScurecurrentPassword,
                    controller: controller.currentpasswordController,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.onScure("Current Password");
                      },
                      child: AssetIcon(
                        assetPath:                          controller.isScurecurrentPassword
                            ? Assets.icons.eye
                            : Assets.icons.eyeClose,
                        color: KzlyColors.secondryText,
                      ),
                    ),
                    validator: (val) {
                      return FormValidator.name(val);
                    }),
                EditSection(
                    tilte: "New Password",
                    hint: "Enter new password",
                    obscureText: controller.isScureNewPassword,
                    icon: Assets.icons.password,
                    controller: controller.newpasswordController,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.onScure("New Password");
                      },
                      child: AssetIcon(
                        assetPath: controller.isScureNewPassword
                            ? Assets.icons.eye
                            : Assets.icons.eyeClose,
                        color: KzlyColors.secondryText,
                      ),
                    ),
                    validator: (val) {
                      return FormValidator.name(val);
                    }),
                EditSection(
                    tilte: "Confirm Password",
                    hint: "Confirm new password",
                    obscureText: controller.isScureConfirmPassword,
                    icon: Assets.icons.password,
                    controller: controller.confirmpasswordController,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.onScure("Confirm Password");
                      },
                      child: AssetIcon(
                        assetPath: controller.isScureConfirmPassword
                            ? Assets.icons.eye
                            : Assets.icons.eyeClose,
                        color: KzlyColors.secondryText,
                      ),
                    ),
                    validator: (val) {
                      if (controller.newpasswordController !=
                              controller.confirmpasswordController &&
                          controller.newpasswordController.text.isNotEmpty) {
                        return "no matched passowrd";
                      }
                      return FormValidator.name(val);
                    }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
                  child: FilledButton(
                    style: ButtonThemes.primary.copyWith(
                        fixedSize: WidgetStatePropertyAll(Size(Get.width, 48))),
                    child: Text("Change Password",
                        style:
                            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
                    onPressed: () {
                      controller.changePassword();
                    },
                  ),
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}
