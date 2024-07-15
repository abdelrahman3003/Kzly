import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/widgets/courses/courses_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopRatingList extends StatelessWidget {
  const TopRatingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Top Rating",
                style: TextStyle(
                    color: KzlyColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp)),
            TextButton(
              onPressed: () {
                Get.toNamed(kAllCoursesPage);
              },
              child: Text("See all",
                  style: TextStyle(
                      color: KzlyColors.primary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700)),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const CoursesCard(),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
            itemCount: 3)
      ],
    );
  }
}
