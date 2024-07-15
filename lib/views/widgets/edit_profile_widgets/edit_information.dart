import 'dart:io';

import 'package:flowers_store/controllers/edit_profile/edit_profile_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/shared/about_textformfiled.dart';
import 'package:flowers_store/herlpers/shared/enums/enum.dart';
import 'package:flowers_store/herlpers/shared/lotties/Offine_lottie.dart';
import 'package:flowers_store/views/widgets/flowerist/edit_profile/edit_section.dart';
import 'package:flowers_store/views/widgets/flowerist/edit_profile/flowerist_section_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';

class EditInformation extends StatelessWidget {
  final bool isFlowerist;
  const EditInformation({super.key, this.isFlowerist = true});
  @override
  Widget build(BuildContext context) {
    Get.put(FolweristAndCoachesEditProfileControllerImp(isFlowerist: isFlowerist));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GetBuilder<FolweristAndCoachesEditProfileControllerImp>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.offlineFailure
            ? const Offline()
            : controller.statusRequest == StatusRequest.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Form(
                    key: controller.infoformKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: KzlyColors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 12),
                          child: AboutTextformfiled(
                            controller: controller.descriptionController,
                            hint: "Write about your self as a florist...",
                            onsubmit: (value) => controller.uploadInfo(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Description can't be empty";
                              }
                              return null;
                            },
                            suffixIcon: const Icon(SolarIconsOutline.pen,
                                color: KzlyColors.black),
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (isFlowerist) ...[
                          Text(
                            "Your Work",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: KzlyColors.black),
                          ),
                          SizedBox(height: 8.h),
                          ListView.builder(
                            itemCount: controller.worksimagesList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    hintText: controller
                                            .worksimagesList[index].imageUrl.isEmpty
                                        ? "Upload your work"
                                        : controller.worksimagesList[index].imageUrl,
                                    prefixIcon: controller
                                            .worksimagesList[index].imageUrl.isEmpty
                                        ? const Icon(SolarIconsOutline.galleryAdd,
                                            size: 24, color: KzlyColors.greyColor)
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w, vertical: 8.h),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(4),
                                              child: File(controller
                                                          .worksimagesList[index]
                                                          .toString())
                                                      .existsSync()
                                                  ? Image.file(
                                                      File(controller
                                                          .worksimagesList[index]
                                                          .imageUrl),
                                                      width: 25.w,
                                                      height: 25.h)
                                                  : Image.network(
                                                      width: 25.w,
                                                      height: 25.h,
                                                      controller
                                                          .worksimagesList[index]
                                                          .imageUrl),
                                            ),
                                          ),
                                    suffixIcon: controller.worksimagesList[index]
                                            .imageUrl.isNotEmpty
                                        ? IconButton(
                                            onPressed: () =>
                                              controller.removeWorkImage(index),
                                            icon: const Icon(
                                              SolarIconsOutline.closeCircle,
                                              size: 18,
                                              color: KzlyColors.primary,
                                            ))
                                        : IconButton(
                                            onPressed: () {
                                              controller.pickImage(index);
                                            },
                                            icon: const Icon(
                                              SolarIconsOutline.upload,
                                              size: 18,
                                              color: KzlyColors.primary,
                                            ))),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.addAnotherWork(),
                            child: Text(
                              "Add Another Work",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: KzlyColors.primary,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 12.h),
                        ],
                        EditSection(
                          tilte: "URL (Contains your work)",
                          icon: Assets.icons.link,
                          readOnly: true,
                          enable: false,
                          hint: "https://www.example.com",
                          controller: controller.urlController,
                        ),
                        EditSection(
                          tilte: "Cost per hour",
                          readOnly: true,
                          enable: false,
                          hint: "0.00",
                          controller: controller.costController,
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 8.w, top: 10.h),
                            child: Text(
                              "/hr",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: KzlyColors.primary),
                            ),
                          ),
                          icon: Assets.icons.dollar,
                        ),
                        Text(
                          "Your Sections",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ), 
                        FloweristSectionField(
                            options: KzlySections.values.map((e)=>e.name.capitalizeFirst!).toList(),
                            selectedOptions: controller.selectedSection,
                            onChanged: (value) {},
                          ),
                        const SizedBox(height: 8),
                        Center(
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "If you want to change your disable data\t",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  color: KzlyColors.black,
                                )),
                            TextSpan(
                                text: "Contact Us",
                                style: TextStyle(
                                    color: KzlyColors.primary,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700))
                          ])),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  )),
      ),
    );
  }
}
