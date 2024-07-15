import 'package:flowers_store/controllers/filter_controller.dart';
import 'package:flowers_store/controllers/flowrist/flowrist_list_controller.dart';

import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/sheets/filters/florist_filter_sheet.dart';

import 'package:flowers_store/views/widgets/flowerist/flowrist_card.dart';
import 'package:flowers_store/views/themes/shadow_themes.dart';
import 'package:flowers_store/views/widgets/shared/kzly_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_appbar_flowrist.dart';

class FlowristList extends StatelessWidget {
  const FlowristList({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FlowristControllerImp());
    Get.put(FilterControllerImp());
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: const CustomAppbarFlowrist(title: "Florist list"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFEFEFE),
            boxShadow: [BoxShadowThemes.mainShadow],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFEFEFE),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 16,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: KzlySearchBar(
                        onSubmit: (e) {},
                        onFilterPressed: () => FloristFilterSheet.show(),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: KzlyColors.secondry,
                            borderRadius: BorderRadius.circular(16.w)),
                        child: Text(
                          "Wedding",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: KzlyColors.primary),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
              //SizedBox(height: 12.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Florists (51)",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Join Us",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: KzlyColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.images.length,
                        itemBuilder: (context, index) => FlowristCard(
                          name: controller.names[index],
                          image: controller.images[index],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
