import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/dialogs/review_dialog.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/courses/about_course.dart';
import 'package:flowers_store/views/widgets/courses/course_lessons_list.dart';
import 'package:flowers_store/views/widgets/courses/instructor_course_details.dart';
import 'package:flowers_store/views/widgets/courses/show_video_course.dart';
import 'package:flowers_store/views/widgets/custom_appbar_flowrist.dart';
import 'package:flowers_store/views/widgets/review/rating_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: const CustomAppbarFlowrist(title: "Course Details"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///This will be Show Video
                    const ShowVideoCourse(),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Wedding Flower Design School for the DIY",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: KzlyColors.black),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    ///This Row of User Details
                    const InstructorCourseDetails(),
                    SizedBox(
                      height: 16.h,
                    ),

                    ///Description of The Course
                    Text(
                      "Description",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: KzlyColors.purpleBlack),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ReadMoreText(
                      'Learn how to create your own wedding flowers from Bouquets, Corsages, Boutonnieres, Decor, and Centerpieces Learn how to create your own wedding flowers from Bouquets, Corsages, Boutonnieres, Decor, and Centerpieces,Learn how to create your own wedding flowers from Bouquets, Corsages, Boutonnieres, Decor, and Centerpieces,Learn how to create your own wedding flowers from Bouquets, Corsages, Boutonnieres, Decor, and Centerpieces,Learn how to create your own wedding flowers from Bouquets, Corsages, Boutonnieres, Decor, and Centerpieces',
                      trimMode: TrimMode.Line,
                      trimLines: 3,
                      colorClickableText: KzlyColors.primary,
                      trimCollapsedText: '\tRead more',
                      trimExpandedText: '\tRead less',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: KzlyColors.subtitle),
                      lessStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: KzlyColors.primary),
                      moreStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: KzlyColors.primary),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),

                    ///This Will Show When The Instructor in Online
                    const Visibility(visible: false, child: CourseLessonsList()),

                    ///This will Show When The Instructor is OnSite
                    const Visibility(child: AboutCourseContent()),
                    SizedBox(
                      height: 24.h,
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Reviews",
                              style: TextStyle(
                                  color: KzlyColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700)),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(kAllReviewsPage);
                            },
                            child: Text("See all",
                                style: TextStyle(
                                    color: KzlyColors.primary,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ]),

                    ///Review
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 16),
                      child: RatingSummary(
                          averageRating: 4.5,
                          onTapWriteReview: () => Get.dialog(ReviewDialog(
                          onsubmit: () {},
                          cancel:()=>Get.back(),
                        )),
                        numberOfReviews: 260,
                          ratings: [0.6, 0.4, .9, .3, .1]),
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        separatorBuilder: (context, index) => const Divider(
                              indent: 16,
                              endIndent: 16,
                            ),
                        itemBuilder: (context, index) {
                          /// TODO: ADD Review
                          //return const ReviewListTile(
                          //  title: "Title",
                          //  description: "Description",
                          //  rating: 4.5,
                          //);
                        })
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              color: KzlyColors.backgroundColor,
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      style: ButtonThemes.primary,
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: KzlyColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
