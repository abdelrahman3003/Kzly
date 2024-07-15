import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CachCoursesCard extends StatelessWidget {
  const CachCoursesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 125.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: KzlyColors.white,
        ),
        child: Row(children: [
          Container(
            width: 79.w,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                image: DecorationImage(
                    image: AssetImage("assets/images/male_florist.jpg"),
                    fit: BoxFit.cover)),
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Floristy Diploma",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: KzlyColors.primary,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  )),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 5.h),
                                decoration: BoxDecoration(
                                  color: KzlyColors.secondry,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "4.5",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: KzlyColors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(width: 5.w),
                                      SvgPicture.asset(
                                          width: 12.w,
                                          height: 12.h,
                                          color: KzlyColors.rating,
                                          Assets.icons.starFilled)
                                    ]),
                              ),
                            ]),
                        Text(
                            "Coach with a passion for floral design, offering an engaging course on the art of working with flowers.",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: KzlyColors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            )),
                        Text("Sun, Mon - 09am:11am",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: KzlyColors.greyColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Time\t${23}h",
                                style: TextStyle(
                                  color: KzlyColors.greyColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Price:\t${300}\$",
                                style: TextStyle(
                                  color: KzlyColors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ])
                      ])))
        ]));
  }
}
