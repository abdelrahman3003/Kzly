import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CoursesCard extends StatelessWidget {
  final String imageUrl;
  final bool isCoursesCoach;
  const CoursesCard(
      {super.key,
      this.imageUrl = "assets/images/woman_flowrist.jpg",
      this.isCoursesCoach = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(kCourseDetailsPage),
      child: Container(
        height: 158.h,
        decoration: BoxDecoration(
            color: KzlyColors.white,
            borderRadius: BorderRadius.circular(8.w),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 10,
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ]),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 0.8,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(imageUrl))),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsetsDirectional.only(
                    start: 8.w, end: 10.w, top: 5.h, bottom: 5.h),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text("Floristry Diploma",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: KzlyColors.textdarkpurple,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp)),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: KzlyColors.secondry,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "4.5",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: KzlyColors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(width: 5.w),
                                SvgPicture.asset(
                                    width: 10.w,
                                    height: 10.h,
                                    color: KzlyColors.rating,
                                    Assets.icons.starFilled)
                              ]),
                        ),
                      ],
                    ),
                    if (isCoursesCoach)
                      Text(
                        "Members: ${35}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: KzlyColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),
                    Text(
                      "Learn how to become a florist and create....",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: KzlyColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    if (!isCoursesCoach)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 10.w,
                            backgroundImage: const AssetImage(
                              "assets/images/person.png",
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Expanded(
                            child: Text(
                              "Ahmed Zayed",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: KzlyColors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp),
                            ),
                          )
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Sun, Mon - 9:00 am ~ 11:00 am",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: KzlyColors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp),
                          ),
                        ),
                        Text(
                          "900 EGP",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: KzlyColors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 11.sp),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
