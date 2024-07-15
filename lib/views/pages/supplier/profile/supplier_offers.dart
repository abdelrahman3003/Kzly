import 'package:flowers_store/controllers/supplier/supplier_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/shared/enums/enum.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SupplierOffers extends StatelessWidget {
  const SupplierOffers({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SupplierControllerImp());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<SupplierControllerImp>(
              builder: (controller) => SingleChildScrollView(
                child: DataTable(
                    horizontalMargin: 6.0,
                    columnSpacing: 6.0,
                    headingRowHeight: 32.0,
                    dataRowMaxHeight: 50.h,
                    dataRowMinHeight: 25.h,
                    headingTextStyle: TextStyle(
                        color: KzlyColors.primary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                    border: TableBorder.all(color: KzlyColors.greyColor),
                    columns: [
                      DataColumn(
                        label: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 80.w,
                            minWidth: 80.w,
                          ),
                          child: const Text(
                            'Offer',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 80.w,
                            minWidth: 80.w,
                          ),
                          child: const Text(
                            "Status",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const DataColumn(
                          label: Expanded(
                        child: Text(
                          'Notes',
                          textAlign: TextAlign.center,
                        ),
                      )),
                    ],
                    rows: controller.rowList
                        .map((element) => DataRow(cells: [
                              DataCell(Center(
                                child: Text(
                                  element["price"],
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: KzlyColors.black),
                                ),
                              )),
                              DataCell(Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 6.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: element["status"] == KzlyStatus.approved.name
                                        ? KzlyColors.lightgreenColor
                                        : element["status"] == KzlyStatus.pending.name
                                            ? KzlyColors.lightorangeColor
                                            : KzlyColors.lightredColor,
                                  ),
                                  child: Text(
                                    element["status"].toString().capitalizeFirst!,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color:
                                            element["status"] == KzlyStatus.approved.name
                                                ? KzlyColors.greenColor
                                                : element["status"] ==
                                                        KzlyStatus.pending.name
                                                    ? KzlyColors.orangeColor
                                                    : KzlyColors.redColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )),
                              DataCell(
                                Center(
                                  child: Text(
                                    element["notes"],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:
                                            element["status"] == KzlyStatus.pending.name
                                                ? KzlyColors.greyColor
                                                : KzlyColors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ]))
                        .toList()),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: FilledButton(
                style: ButtonThemes.primary.copyWith(
                    fixedSize: WidgetStatePropertyAll(Size(Get.width, 48))),
                onPressed: () {},
                child: Text(
                  "See Last offers",
                  style: TextStyle(
                      color: KzlyColors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700),
                )),
          )
        ],
      ),
    );
  }
}
