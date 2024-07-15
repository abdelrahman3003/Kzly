import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/widgets/shared/stars_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InstructorCourseDetails extends StatelessWidget {
  const InstructorCourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Right Side
        CircleAvatar(
          radius: 20.r,
          backgroundImage: const AssetImage("assets/images/person.png"),
        ),

        SizedBox(
          width: 8.w,
        ),
        //This for name of instractor and Rating of it
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Ahmed Zayed",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: KzlyColors.black)),
              SizedBox(
                height: 5.w,
              ),
              StarRating(rating: 4.5, starSize: 16.w),
            ],
          ),
        ),
        //Left Side
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: KzlyColors.greenColor,
                  radius: 4.r,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "Online",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: KzlyColors.greenColor),
                )
              ],
            ),
            Text(
              "Sun,Mon 9am:11am",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 7.sp,
                  color: KzlyColors.greyColor),
            ),
            Text(
              "EGP 1550",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: KzlyColors.primary),
            )
          ],
        ),
      ],
    );
  }
}
