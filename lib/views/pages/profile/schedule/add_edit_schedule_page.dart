import 'package:flowers_store/controllers/edit_profile/edit_profile_controller.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/shared/custom_dropdown_button.dart';
import 'package:flowers_store/herlpers/shared/enums/enum.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';

class AddEditSchedulePage
    extends GetView<FolweristAndCoachesEditProfileControllerImp> {
  const AddEditSchedulePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            Get.arguments != null ? "Edit Schedule" : "Add Schedule",
            style: TextThemes.label,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: KzlyColors.purpleBlack,
              size: 24,
            ),
          )),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: GetBuilder<FolweristAndCoachesEditProfileControllerImp>(
                  builder: (controller) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: controller.scheduleformKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select Day",
                                style: TextStyle(
                                  color: KzlyColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomDropdownButton(
                                  items: KzlyDays.values
                                      .map((e) => e.name.capitalizeFirst!)
                                      .toList(),
                                  onChanged: (value) => controller.selectDay(value!),
                                  enabled: Get.arguments != null ? false : true,
                                  hinttext: 'Select Day',
                                  value: controller.day,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field is required";
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: 8.h,
                              ),
                              Column(
                                  children: List.generate(
                                controller.timeLists.length,
                                (index) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                          child: timeTextField(
                                        controllerText:
                                            controller.timeLists[index].startHour,
                                        onTap: () => controller.chooseTime(
                                            isStartTime: true, index: index),
                                        fieldHint: 'Select time',
                                        text: 'Start time',
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "This field is required";
                                          }
                                          return null;
                                        },
                                      )),
                                      SizedBox(width: 8.w),
                                      Expanded(
                                        child: timeTextField(
                                          controllerText:
                                              controller.timeLists[index].endHour,
                                          onTap: () =>
                                              controller.chooseTime(index: index),
                                          fieldHint: 'Select time',
                                          text: 'End time',
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "This field is required";
                                            } else if (controller.timeLists[index]
                                                        .startHour !=
                                                    null &&
                                                controller.checkTime(
                                                    index: index, endTime: value)) {
                                              return "Time must after start time";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      if (index != 0 ||
                                          controller.timeLists[index].id !=
                                              null) ...[
                                        TextButton(
                                            onPressed: () => controller
                                                .deleteRowOfTime(index: index),
                                            child: controller.statusRequest ==
                                                    StatusRequest.loading
                                                ? const Center(
                                                    child: CircularProgressIndicator(
                                                      strokeWidth: 3,
                                                    ),
                                                  )
                                                : Text("Clear",
                                                    style: TextStyle(
                                                        color: KzlyColors.primary,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16.sp)))
                                      ]
                                    ],
                                  ),
                                ),
                              )),
                              SizedBox(
                                height: 8.h,
                              ),
                              if (Get.arguments == null) ...[
                                GestureDetector(
                                    onTap: () => controller.addAnotherRowofTime(),
                                    child: Text(
                                      "Add another time",
                                      style: TextStyle(
                                        color: KzlyColors.primary,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              ]
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        color: KzlyColors.backgroundColor,
                        alignment: Alignment.bottomCenter,
                        child: FilledButton(
                          onPressed: () =>
                              controller.statusRequest == StatusRequest.loading
                                  ? {}
                                  : controller.saveSchedule(),
                          style: ButtonThemes.primary.copyWith(
                              fixedSize:
                                  WidgetStateProperty.all(Size(Get.width, 48))),
                          child: controller.statusRequest == StatusRequest.loading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: KzlyColors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                              : Text(
                                  'Save',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: KzlyColors.white),
                                ),
                        )),
                  ],
                );
              }))),
    );
  }

  Column timeTextField(
      {required String fieldHint,
      required String text,
      String? controllerText,
      Function()? onTap,
      String? Function(String?)? validator}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: KzlyColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          readOnly: true,
          onTap: onTap,
          controller: TextEditingController(text: controllerText),
          validator: validator,
          decoration: InputDecoration(
            hintText: fieldHint,
            isDense: true,
            helperText: "",
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.3.w),
                borderRadius: BorderRadius.circular(4.0)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.3.w),
                borderRadius: BorderRadius.circular(4.0)),
            prefixIcon: Icon(SolarIconsOutline.clockCircle,
                color: KzlyColors.primary, size: 24.w),
          ),
        ),
      ],
    );
  }
}
