import 'package:flowers_store/controllers/edit_profile/edit_profile_controller.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/herlpers/shared/lotties/Offine_lottie.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/flowerist/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Schedule extends GetView<FolweristAndCoachesEditProfileControllerImp> {
  final bool isFlowerist;
  const Schedule({super.key, this.isFlowerist = true});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FolweristAndCoachesEditProfileControllerImp>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.offlineFailure
            ? const Offline()
            : controller.statusRequest == StatusRequest.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.floristDataModel.schedule == null ||
                        controller.floristDataModel.schedule!.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Empty",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.sp,
                                  color: KzlyColors.black),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "Add your working days & hours and save to receive bookings",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: KzlyColors.greyColor),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Image.asset("assets/images/schedule.png",
                                fit: BoxFit.fill, width: 200.w, height: 205.h),
                            SizedBox(
                              height: 40.h,
                            ),
                            FilledButton(
                                onPressed: () {
                                  controller.cleanData();
                                  Get.toNamed(
                                    kAddEditSchedulePage,
                                  );
                                },
                                style: ButtonThemes.primary,
                                child: Text(
                                  "Add your working time",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: KzlyColors.white),
                                ))
                          ],
                        ))
                    : Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        child: Column(
                          children: [
                            Expanded(
                                child: SingleChildScrollView(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: controller
                                      .floristDataModel.schedule!.entries
                                      .map(
                                        (e) => Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  e.key,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: KzlyColors.black,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.editData(data: e);
                                                    Get.toNamed(kAddEditSchedulePage,
                                                        arguments: true);
                                                  },
                                                  child: Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: KzlyColors.primary,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 12.h),
                                            ScheduleCard(
                                              showDay: false,
                                              schedule: e.value,
                                            ),
                                            Divider(
                                              color: KzlyColors.primary
                                                  .withOpacity(0.5),
                                              thickness: 2,
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList()),
                            )),
                            Container(
                                color: KzlyColors.backgroundColor,
                                alignment: Alignment.bottomCenter,
                                child: Row(children: [
                                  Expanded(
                                    child: FilledButton(
                                      onPressed: () {
                                        controller.cleanData();
                                        Get.toNamed(kAddEditSchedulePage);
                                      },
                                      style: ButtonThemes.primary,
                                      child: Text(
                                        'Add your working time',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            color: KzlyColors.white),
                                      ),
                                    ),
                                  ),
                                ])),
                          ],
                        ),
                      ));
  }
}
