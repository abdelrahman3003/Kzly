import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReviewCard extends StatelessWidget {
  final double width;
  const ReviewCard({super.key,this.width =250});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width.w,
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 14.w,vertical:14.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: KzlyColors.white,
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          CircleAvatar(
              radius: 20.w,
              backgroundImage: const AssetImage("assets/images/avatar.png")),
          const SizedBox(width: 10),
          Expanded(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text("Faraj Abdullah",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: KzlyColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(width: 10.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: KzlyColors.secondry,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Row(children: [
                      Text(
                        "4.5",
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
                  ]),
                )
              ],
            ),
            SizedBox(height: 4.h),
            Text(
                "I loved the store very much and i will not deal with themagain God willing",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: KzlyColors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500))
          ]))
        ]));
  }
}
