import 'package:flowers_store/controllers/address/address_controller.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/shared/lotties/Offine_lottie.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/address/address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';

class MyAddressesPage extends StatelessWidget {
  const MyAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Addresses",
            style: TextStyle(
                color: KzlyColors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700),
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<AddressControllerImp>(
                  builder: (controller) => Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Address List (${controller.addressDataList.length})",
                          style: TextStyle(
                              color: KzlyColors.purpleBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp),
                        ),
                      )),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                  child: GetBuilder<AddressControllerImp>(
                      builder: (controller) => controller.statusRequest ==
                              StatusRequest.offlineFailure
                          ? const Offline()
                          : controller.statusRequest == StatusRequest.loading &&
                                  !controller.hasMore
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : controller.statusRequest == StatusRequest.success &&
                                      controller.addressDataList.isEmpty
                                  ? Center(
                                      child: Text(
                                        "No Data Found",
                                        style: TextStyle(
                                            color: KzlyColors.red,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.sp),
                                      ),
                                    )
                                  : ListView.separated(
                                      controller: controller.scrollController,
                                      physics: const BouncingScrollPhysics(),
                                      padding: EdgeInsets.symmetric(vertical: 16.h),
                                      itemBuilder: (contex, index) {
                                        if (index <
                                            controller.addressDataList.length) {
                                          return GestureDetector(
                                            onTap: () => controller.selectItemList(
                                                index: index),
                                            child: AddressCard(
                                              data:
                                                  controller.addressDataList[index],
                                              onTapDelete: () => controller
                                                  .deleteItemList(index:index),
                                              onTapEdit: () => {},
                                              onDissmisedpopUp: () => Get.back(),
                                              radiovalue: index,
                                              radioselected: controller.choice,
                                              onTapRadio: (value) => controller
                                                  .selectItemList(index: value!),
                                            ),
                                          );
                                        } else {
                                          return const Center(
                                              child: CircularProgressIndicator());
                                        }
                                      },
                                      separatorBuilder: (context, index) => SizedBox(
                                            height: 16.h,
                                          ),
                                      itemCount: controller.hasMore
                                          ? controller.addressDataList.length + 1
                                          : controller.addressDataList.length))),
              GetBuilder<AddressControllerImp>(builder: (controller) {
                return Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: FilledButton.icon(
                    style: ButtonThemes.secondary.copyWith(
                        fixedSize: WidgetStatePropertyAll(Size(Get.width, 48))),
                    icon: const Icon(
                      SolarIconsOutline.addSquare,
                      size: 24,
                      color: KzlyColors.primary,
                    ),
                    label: Text("Add New Address",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: KzlyColors.primary)),
                    onPressed: () => controller.addNewAddress(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
