import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

///This Widget Called in CoursesDetailsPage
class AboutCourseContent extends StatelessWidget {
  const AboutCourseContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "About Course :",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: KzlyColors.purpleBlack),
        ),
        SizedBox(
          height: 8.h,
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/play-circle.svg",
            fit: BoxFit.cover,
            width: 22.w,
            height: 22.h,
          ),
          titleTextStyle: TextStyle(
              color: KzlyColors.purpleBlack,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp),
          dense: true,
          trailing: Text(
            "00h:05mm",
            style: TextStyle(
                color: KzlyColors.purpleBlack,
                fontWeight: FontWeight.w500,
                fontSize: 11.sp),
          ),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: KzlyColors.purple, width: 2),
              borderRadius: BorderRadius.circular(8)),
          title: const Text(
            'Introduction',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/clipboard_list.svg",
            fit: BoxFit.cover,
            width: 22.w,
            height: 22.h,
          ),
          dense: true,
          titleTextStyle: TextStyle(
              color: KzlyColors.purpleBlack,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp),
          trailing: Text("Open",
              style: TextStyle(
                  color: KzlyColors.primary,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: KzlyColors.primary)),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: KzlyColors.purple, width: 2),
              borderRadius: BorderRadius.circular(8)),
          subtitle: const Text(
            "what you study in this course.",
            overflow: TextOverflow.ellipsis,
          ),
          subtitleTextStyle: TextStyle(
              color: KzlyColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 8.sp),
          title: const Text(
            'Course Content',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icons/gps.svg",
            fit: BoxFit.cover,
            width: 22.w,
            height: 22.h,
          ),
          dense: true,
          titleTextStyle: TextStyle(
              color: KzlyColors.subtitle,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp),
          trailing: Text("Open mab",
              style: TextStyle(
                  color: KzlyColors.primary,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: KzlyColors.primary)),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: KzlyColors.purple, width: 2),
              borderRadius: BorderRadius.circular(8)),
          subtitle: const Text(
            "3 Ramadan st, Naser City, Egypt",
            overflow: TextOverflow.ellipsis,
          ),
          subtitleTextStyle: TextStyle(
              color: KzlyColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 8.sp),
          title: const Text('Course Location', overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }
}
