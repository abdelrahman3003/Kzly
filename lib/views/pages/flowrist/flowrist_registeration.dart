import 'package:flowers_store/controllers/flowrist/flowrist_registration_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/shared/enums/enum.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/shared/asset_icon.dart';
import 'package:flowers_store/views/widgets/shared/sections_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../herlpers/function/validation.dart';

class FlowristRegistration extends StatelessWidget {
  const FlowristRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FlowristRegisterationControllerImp());
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Join Us Florist",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700))),
        body: GetBuilder<FlowristRegisterationControllerImp>(
          builder: (controller) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full Name",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.fullname,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          hintText: "Enter your name",
                          prefixIcon: Icon(
                            SolarIconsOutline.user,
                            size: 24,
                            color: KzlyColors.secondryText,
                          )),
                      validator: (val) {
                        return FormValidator.name(val);
                      },
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Email Address",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter your email address",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.email,
                            size: const Size(24, 24),
                            color: KzlyColors.secondryText,
                          )),
                      validator: (val) {
                        return FormValidator.email(val);
                      },
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.password,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isPasswordSecure,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        prefixIcon: const Icon(SolarIconsOutline.password,
                            size: 24, color: KzlyColors.greyColor),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.onSecure("Password");
                          },
                          child: controller.isPasswordSecure
                              ? const Icon(SolarIconsOutline.eye,
                                  size: 24, color: KzlyColors.greyColor)
                              : const Icon(SolarIconsOutline.eyeClosed,
                                  size: 24, color: KzlyColors.greyColor),
                        ),
                      ),
                      validator: (val) {
                        return FormValidator.password(val);
                      },
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Confirm Password",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.confPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isConfirmSecure,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        prefixIcon: const Icon(SolarIconsOutline.password,
                            size: 24, color: KzlyColors.greyColor),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.onSecure("Confirm Password");
                          },
                          child: controller.isConfirmSecure
                              ? const Icon(SolarIconsOutline.eye,
                                  size: 24, color: KzlyColors.greyColor)
                              : const Icon(SolarIconsOutline.eyeClosed,
                                  size: 24, color: KzlyColors.greyColor),
                        ),
                      ),
                      validator: (val) {
                        return FormValidator.confirmPassword(
                            val, controller.password.text);
                      },
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Phone Number",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.phone,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Enter your phone number",
                        prefixIcon: Icon(SolarIconsOutline.phone,
                            size: 24, color: KzlyColors.greyColor),
                      ),
                      validator: (val) {
                        return FormValidator.phone(val);
                      },
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "National ID",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.nationalId,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Enter your National ID",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.national,
                            color: KzlyColors.secondryText,
                          )),
                      validator: (val) {
                        return FormValidator.national(val);
                      },
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Choose Your section",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 32.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            SectionsFields(
                                isSelected: controller.sections.contains(KzlySections
                                        .values[index].name.toLowerCase())
                                    ? true
                                    : false,
                                title:
                                    KzlySections.values[index].name.capitalizeFirst!,
                                onTap: () => controller.selected(KzlySections
                                    .values[index].name.toLowerCase())),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          width: 8.w,
                        ),
                        itemCount: KzlySections.values.length,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Enter your URL",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.url,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                          hintText: "URL (Contains your work)",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.link,
                            color: KzlyColors.secondryText,
                          )),
                      validator: (val) {
                        return FormValidator.url(val);
                      },
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Certificate",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    ListView.builder(
                      itemCount: controller.pickCertificateList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: TextFormField(
                          controller: controller.ceritficateControllerList[index],
                          onTap: () async {
                            await controller.pickFile(index);
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: "Upload your certificate",
                              prefixIcon: AssetIcon(
                                assetPath: Assets.icons.certificate,
                                color: KzlyColors.secondryText,
                              ),
                              suffixIcon:
                                  controller.pickCertificateList[index] != null
                                      ? IconButton(
                                          onPressed: () {
                                            controller.disposeFile(index);
                                          },
                                          icon: const Icon(Icons.close))
                                      : null),
                          validator: (val) {
                            return index == 0 &&
                                    controller
                                        .ceritficateControllerList[0].text.isEmpty
                                ? "Certification can't be empty"
                                : null;
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.addCertificate();
                      },
                      child: Text(
                        "Add another certificate",
                        style: TextStyle(fontSize: 16.sp, color: KzlyColors.primary),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "CV",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.cvController,
                      onTap: () async {
                        await controller.pickFile(0, iscv: true);
                      },
                      decoration: InputDecoration(
                          hintText: "Upload your CV",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.url,
                            color: KzlyColors.secondryText,
                          ),
                          suffixIcon: controller.cvController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () async {
                                    await controller.disposeFile(0, iscv: true);
                                  },
                                  icon: const Icon(Icons.close))
                              : null),
                      readOnly: true,
                      validator: (val) {
                        return controller.cvController.text.isEmpty
                            ? "CV can't be empty"
                            : null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: FilledButton(
                        style: ButtonThemes.primary.copyWith(
                            fixedSize:
                                WidgetStatePropertyAll(Size(Get.width, 48.h))),
                        onPressed: () => controller.submit(),
                        child: controller.statusRequest == StatusRequest.loading
                            ? const Center(
                                child:CircularProgressIndicator(
                                    color: KzlyColors.white))
                            : Text("Submit",
                                style: TextStyle(
                                    color: KzlyColors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
