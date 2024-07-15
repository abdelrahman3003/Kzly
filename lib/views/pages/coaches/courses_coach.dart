import 'package:flowers_store/views/widgets/courses/courses_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesCoach extends StatelessWidget {
  const CoursesCoach({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const CoursesCard(
            imageUrl: "assets/images/male_florist.jpg", isCoursesCoach: true),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
        itemCount: 10);
  }
}
