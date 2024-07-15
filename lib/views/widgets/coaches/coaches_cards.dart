import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/shadow_themes.dart';
import 'package:flowers_store/views/widgets/coaches/coaches_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CoachesCards extends StatelessWidget {
  final Function()? onTap;
  const CoachesCards({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: KzlyColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadowThemes.mainShadow],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 20.w,
                  backgroundColor: Colors.teal,
                  backgroundImage: AssetImage(Assets.images.avatar.path),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "Ahmed Zayed",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: KzlyColors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: KzlyColors.secondry,
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    color: KzlyColors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 1.5.w),
                                SvgPicture.asset(
                                  Assets.icons.starFilled,
                                  width: 12.w,
                                  height: 12.h,
                                  color: KzlyColors.rating,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "Weeding Events",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: KzlyColors.greyColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Text(
                            "${3} Courses",
                            style: TextStyle(
                              color: KzlyColors.primary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 66.h, // Adjust the height as needed
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CoachesCourses(),
                separatorBuilder: (context, index) => SizedBox(width: 8.w),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
