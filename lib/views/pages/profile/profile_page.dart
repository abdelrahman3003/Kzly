import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowers_store/controllers/profile/myprofile_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/function/validation.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/coaches/coach_courses_card.dart';
import 'package:flowers_store/views/widgets/shared/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyProfileControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Information',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<MyProfileControllerImp>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: controller.statusRequest == StatusRequest.loading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                height: 115.h,
                                width: 105.w,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: SizedBox(
                                        height: 106.h,
                                        width: 96.w,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: controller.imageFile != null
                                                ? Image.file(
                                                    controller.imageFile!,
                                                    fit: BoxFit.cover,
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl: controller.user
                                                                .profilePicture?[
                                                            'imageUrl'] ??
                                                        "https://xsgames.co/randomusers/avatar.php?g=male",
                                                    fit: BoxFit.cover,
                                                  )),
                                      ),
                                    ),
                                    controller.isformEnable
                                        ? Positioned(
                                            bottom: 4,
                                            right: 2,
                                            child: InkWell(
                                              onTap: () {
                                                controller
                                                    .pickImage(ImageSource.gallery);
                                              },
                                              child: const CircleAvatar(
                                                child: Icon(
                                                    SolarIconsOutline.penNewRound,
                                                    color: KzlyColors.primary),
                                              ),
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Text("Name",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: KzlyColors.textColor)),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    controller.changeformeEnable();
                                  },
                                  child: const Text("Edit",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: KzlyColors.primary)),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            TextFormField(
                              controller: controller.nameController,
                              keyboardType: TextInputType.name,
                              enabled: controller.isformEnable,
                              decoration: InputDecoration(
                                prefixIcon: AssetIcon(
                                  assetPath: Assets.icons.person,
                                  color: KzlyColors.secondryText,
                                ),
                              ),
                              validator: (value) {
                                return FormValidator.name(value);
                              },
                            ),
                            SizedBox(height: 8.h),
                            const Text("\Email Address",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: KzlyColors.textColor)),
                            SizedBox(height: 8.h),
                            TextFormField(
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              enabled: controller.isformEnable,
                              decoration: InputDecoration(
                                  prefixIcon: AssetIcon(
                                assetPath: Assets.icons.email,
                                color: KzlyColors.secondryText,
                              )),
                              validator: (value) {
                                return FormValidator.email(value);
                              },
                            ),
                            SizedBox(height: 8.h),
                            const Text("\tPhone Number",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: KzlyColors.textColor)),
                            SizedBox(height: 8.h),
                            IntlPhoneField(
                                controller: controller.phoneController,
                                enabled: controller.isformEnable,
                                initialCountryCode: "EG"),
                            const Text("\tPassword",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: KzlyColors.textColor)),
                            SizedBox(height: 8.h),
                            TextFormField(
                              controller: controller.passwordController,
                              keyboardType: TextInputType.name,
                              enabled: controller.isformEnable,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Enter your password",
                                  prefixIcon: AssetIcon(
                                    assetPath: Assets.icons.password,
                                    color: KzlyColors.secondryText,
                                  )),
                              validator: (value) {
                                return FormValidator.password(value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: () {
                        controller.saveIformation();
                      },
                      style: ButtonThemes.primary.copyWith(
                          fixedSize: WidgetStatePropertyAll(Size(Get.width, 48.h))),
                      child: controller.savSstatusRequest == StatusRequest.loading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: KzlyColors.white,
                            ))
                          : Text(
                              'Save Information',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ),
                    )
                  ],
                ),
        );
      }),
    );
  }
}
