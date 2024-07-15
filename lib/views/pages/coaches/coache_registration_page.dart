import 'package:flowers_store/controllers/coach/coach_registeration_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/widgets/shared/asset_icon.dart';
import 'package:flowers_store/views/widgets/shared/sections_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../herlpers/function/validation.dart';
import '../../widgets/shared/app_text_button.dart';
import '../../widgets/custom_appbar_flowrist.dart';
import '../../widgets/shared/flowrist_flied.dart';

class CoacheRegistrationPage extends StatelessWidget {
  const CoacheRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CoachRegisterationControllerImp());
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48.h),
            child: const CustomAppbarFlowrist(
              title: "Coach Registration",
            )),
        body: GetBuilder<CoachRegisterationControllerImp>(
          builder: (controller) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FlowristFiled(title: "Email Address"),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter your email address",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.email,
                            size: const Size(24, 24),
                            color: KzlyColors.secondryText,
                          )),
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (val) {
                        return FormValidator.email(val);
                      },
                    ),
                    const FlowristFiled(title: "Name"),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter your name",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.person,
                            color: KzlyColors.secondryText,
                          )),
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (val) {
                        return FormValidator.name(val);
                      },
                    ),
                    const FlowristFiled(title: "Password"),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isPasswordSecure,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        prefixIcon: AssetIcon(
                          assetPath: Assets.icons.password,
                          color: KzlyColors.secondryText,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.onSecure("Password");
                          },
                          child: AssetIcon(
                            assetPath: controller.isPasswordSecure
                                ? Assets.icons.eye
                                : Assets.icons.eyeClose,
                            color: KzlyColors.secondryText,
                          ),
                        ),
                      ),
                      onSaved: (value) {
                        controller.password = value!;
                      },
                      validator: (val) {
                        return FormValidator.password(val);
                      },
                    ),
                    const FlowristFiled(title: "Confirm Password"),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isConfirmSecure,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        prefixIcon: AssetIcon(
                          assetPath: Assets.icons.password,
                          color: KzlyColors.secondryText,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.onSecure("Confirm Password");
                          },
                          child: AssetIcon(
                            assetPath: controller.isConfirmSecure
                                ? Assets.icons.eye
                                : Assets.icons.eyeClose,
                            color: KzlyColors.secondryText,
                          ),
                        ),
                      ),
                      onSaved: (value) {
                        controller.confPassword = value!;
                      },
                      validator: (val) {
                        return FormValidator.confirmPassword(
                            val, controller.password);
                      },
                    ),
                    const FlowristFiled(title: "Phone Number"),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "Enter your phone number",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.phone,
                            color: KzlyColors.secondryText,
                          )),
                      onSaved: (value) {
                        controller.phone = value!;
                      },
                      validator: (val) {
                        return FormValidator.phone(val);
                      },
                    ),
                    const FlowristFiled(title: "National ID"),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Enter your National ID",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.national,
                            color: KzlyColors.secondryText,
                          )),
                      onSaved: (value) {
                        controller.national = value!;
                      },
                      validator: (val) {
                        return FormValidator.national(val);
                      },
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Choose Your section",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    GetBuilder<CoachRegisterationControllerImp>(
                      builder: (controller) => SizedBox(
                        height: 32.h,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children:[
                            SectionsFields(title: "Bouqet ", onTap: () {  },),
                            SectionsFields(title: "Events", onTap: () {  },),
                            SectionsFields(title: "Wedding", onTap: () {  },),
                          ],
                        ),
                      ),
                    ),
                    const FlowristFiled(title: "Enter your URL"),
                    TextFormField(
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                          hintText: "URL (Contains your work)",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.url,
                            color: KzlyColors.secondryText,
                          )),
                      onSaved: (value) {
                        controller.url = value!;
                      },
                      validator: (val) {
                        return FormValidator.url(val);
                      },
                    ),
                    const FlowristFiled(title: "Ceritficate"),
                    ListView.builder(
                      itemCount: controller.pickCertificateList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: TextFormField(
                          controller:
                              controller.ceritficateControllerList[index],
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
                                    controller.ceritficateControllerList[0].text
                                        .isEmpty
                                ? null
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
                        style: TextStyle(
                            fontSize: 16.sp, color: KzlyColors.primary),
                      ),
                    ),
                    const FlowristFiled(title: "CV"),
                    TextFormField(
                      controller: controller.cvController,
                      onTap: () async {
                        await controller.pickFile(0, iscv: true);
                      },
                      decoration: InputDecoration(
                          hintText: "Upload your CV",
                          prefixIcon: AssetIcon(
                            assetPath: Assets.icons.certificate,
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
                      child: SizedBox(
                        height: 48.h,
                        child: AppTextButton(
                          buttonText: "Submit",
                          textStyle:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {}
                            //controller.submit();
                            // Get.toNamed(kPendingRequest);
                          },
                          backgroundColor: KzlyColors.primary,
                        ),
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
