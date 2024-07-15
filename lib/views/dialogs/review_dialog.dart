import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/shared/stars_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReviewDialog extends StatelessWidget {
  final Function()? onsubmit;
  final Function()? cancel;
  const ReviewDialog({super.key, this.onsubmit, this.cancel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: KzlyColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Write a Review",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: KzlyColors.purpleBlack),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: StarRating(
                  itemCount: 5,
                  starSize: 32.h,
                  rating: 5,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Overall",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: KzlyColors.purpleBlack),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                style: TextStyle(
                  color: KzlyColors.purpleBlack,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: "Write a review",
                  hintStyle: TextStyle(
                    color: const Color(0x99675F6C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Color(0xFF96919A)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                minLines:
                    6, // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(
                height: 17.h,
              ),
              FilledButton(
                style: ButtonThemes.primary.copyWith(
                    fixedSize: WidgetStatePropertyAll(Size(Get.width, 48.h))),
                onPressed: onsubmit,
                child: Text("Submit",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: KzlyColors.white)),
              ),
              SizedBox(
                height: 12.h,
              ),
              FilledButton(
                  style: ButtonThemes.secondary.copyWith(
                      fixedSize: WidgetStatePropertyAll(Size(Get.width, 48))),
                  onPressed: cancel,
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: KzlyColors.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  )),
            ],
          )),
    ));
  }
}
