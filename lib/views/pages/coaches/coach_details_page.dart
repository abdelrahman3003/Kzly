import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/dialogs/review_dialog.dart';
import 'package:flowers_store/views/widgets/coaches/coach_courses_card.dart';
import 'package:flowers_store/views/widgets/custom_appbar_flowrist.dart';
import 'package:flowers_store/views/widgets/review/rating_summary.dart';
import 'package:flowers_store/views/widgets/shared/stars_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CoachDetailsPage extends StatelessWidget {
  const CoachDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: const CustomAppbarFlowrist(
            title: 'Coach details',
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ColoredBox(
              color: KzlyColors.backgroundColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ///First Row Of Image And Coache Name
                  Container(
                    height: 145.h,
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Row(children: [
                      Container(
                          width: 74.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/person.png"),
                                  fit: BoxFit.cover))),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ahmed Zayed",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: KzlyColors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700)),
                              Text("Events,Weeding,Bouqet",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: KzlyColors.greyColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500)),
                              Text("Cairo,Egypt",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: KzlyColors.greyColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  StarRating(rating: 4.5, starSize: 12.w),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Text("(190 reviews)",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: KzlyColors.greyColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ],
                              )
                            ]),
                      )
                    ]),
                  ),
                  SizedBox(height: 20.h),

                  ///Second Row Of certificate and Experience and Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                              radius: 20.r,
                              backgroundColor: KzlyColors.secondry,
                              child: SvgPicture.asset("assets/icons/certificate.svg",
                                  width: 25.w, height: 25.h)),
                          SizedBox(height: 5.h),
                          Text("6+",
                              style: TextStyle(
                                  color: KzlyColors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700)),
                          Text("Certificaate",
                              style: TextStyle(
                                  color: KzlyColors.greyColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(width: 12.w),
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        CircleAvatar(
                            radius: 20.r,
                            backgroundColor: KzlyColors.secondry,
                            child: SvgPicture.asset("assets/icons/experience.svg",
                                width: 25.w, height: 25.h)),
                        SizedBox(height: 5.h),
                        Text("10+",
                            style: TextStyle(
                                color: KzlyColors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700)),
                        Text("Experience",
                            style: TextStyle(
                                color: KzlyColors.greyColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500))
                      ]),
                      SizedBox(width: 12.w),
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        CircleAvatar(
                            radius: 20.r,
                            backgroundColor: KzlyColors.secondry,
                            child: SvgPicture.asset("assets/icons/review.svg",
                                width: 25.w, height: 25.h)),
                        SizedBox(height: 5.h),
                        Text("110+",
                            style: TextStyle(
                                color: KzlyColors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700)),
                        Text("Reviews",
                            style: TextStyle(
                                color: KzlyColors.greyColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500))
                      ]),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  ///Third This is About Coach
                  Text("About Coach",
                      style: TextStyle(
                          color: KzlyColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 10.h),
                  Text(
                      "Coach with a passion for floral design, offering an engaging course on the art of working with flowers.\nCoach with a passion for floral design, offering an engaging course on the art of working with flowers.",
                      style: TextStyle(
                          color: KzlyColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 15.h),

                  ///Fourth This Row of Coach Courses
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Coach Courses",
                          style: TextStyle(
                              color: KzlyColors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700)),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(kAllCoachCoursesPage);
                        },
                        child: Text("See all",
                            style: TextStyle(
                                color: KzlyColors.primary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  ///Fifith Courses ListView
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: ScrollController(),
                    padding: const EdgeInsets.all(8),
                    itemCount: 3,
                    itemBuilder: (context, index) => const CachCoursesCard(),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 10.h),
                  ),
                  SizedBox(height: 10.h),

                  ///Six Row of Review and seeall
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        /// TODO: Add Review Tile
                        //return const ReviewListTile(
                        //  title: "Title",
                        //  description: "Description",
                        //  rating: 4.5,
                        //);
                      }),
                  SizedBox(height: 10.h),
                ]),
              ),
            ),
          ),
        ));
  }
}
