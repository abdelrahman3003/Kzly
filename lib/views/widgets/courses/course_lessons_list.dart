import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CourseLessonsList extends StatelessWidget {
  const CourseLessonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Lessons : ",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: KzlyColors.purpleBlack),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 252.h,
          child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                    leading: SvgPicture.asset(
                      "assets/icons/play-circle.svg",
                      fit: BoxFit.cover,
                      width: 22.w,
                      height: 22.h,
                    ),
                    titleTextStyle:TextStyle(
                            color: KzlyColors.purpleBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp)
                    ,
                    dense:true,
                    trailing:  Text("00h:05mm",
                    style:
                      TextStyle(
                            color: KzlyColors.purpleBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp),
                   
                    ),
                    
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color:  KzlyColors.purple, width: 2),
                        borderRadius: BorderRadius.circular(8)),
                    title: const Text('Introduction',
                        overflow: TextOverflow.ellipsis,
                       ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
              itemCount: 20),
        ),
      ],
    );
  }
}
