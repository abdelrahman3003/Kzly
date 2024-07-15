import 'package:flowers_store/data/model/addresses/address_data_model.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/dialogs/basic_dialog.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressCard extends StatelessWidget {
  final AddressDataModel data;
  final Function() onTapDelete;
  final Function() onTapEdit;
  final Function() onDissmisedpopUp;
  final Function(int?)? onTapRadio;
  final int radiovalue;
  final int? radioselected;
  const AddressCard({
    super.key,
    required this.data,
    required this.onTapDelete,
    required this.onTapEdit,
    required this.onDissmisedpopUp,
    required this.onTapRadio,
    required this.radiovalue,
    this.radioselected,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
          color:
              radioselected == radiovalue ? KzlyColors.secondry : KzlyColors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: radioselected == radiovalue
                  ? KzlyColors.primary
                  : KzlyColors.greyColor)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location name:",
                style: TextStyle(
                    color: KzlyColors.greyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Text(
                  data.street,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: KzlyColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 24.w,
                height: 24.h,
                child: Radio(
                    value: radiovalue,
                    groupValue: radioselected,
                    onChanged: onTapRadio),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Address:',
                style: TextStyle(
                    color: KzlyColors.greyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Text(
                  "${data.street}\t${data.city}\t${data.country}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: KzlyColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: onTapEdit,
                  style: ButtonThemes.secondary.copyWith(
                      fixedSize: const WidgetStatePropertyAll(Size.fromHeight(42.0)),
                      shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))))),
                  child: Text(
                    "Edit Address",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: KzlyColors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    Get.dialog(BasicDialog(
                        title: "Delete Address",
                        subtitle: "Are you Sure you want Delete Address",
                        onNo: onDissmisedpopUp,
                        onYes: onTapDelete));
                  },
                  style: ButtonThemes.secondary.copyWith(
                      fixedSize: const WidgetStatePropertyAll(Size.fromHeight(42.0)),
                      shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(color: KzlyColors.red),
                          borderRadius: BorderRadius.all(Radius.circular(8))))),
                  child: Text(
                    "Delete Address",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: KzlyColors.red,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
