import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoachesCourses extends StatelessWidget {
  final Function()? onTap;
  const CoachesCourses({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 187.w,
        decoration: BoxDecoration(
          color: KzlyColors.secondry,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage(Assets.images.fl6.path),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Floristy Diploma",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: KzlyColors.purpleBlack,
                        fontSize: 14.sp, //10.sp
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(mainAxisSize: MainAxisSize.max, children: [
                        Text(
                          "4.5",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: KzlyColors.purpleBlack,
                              fontSize: 12.sp, //8.sp
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(width: 3),
                        SvgPicture.asset(
                            width: 14.w,
                            height: 14.h,
                            color: KzlyColors.rating,
                            Assets.icons.starFilled)
                      ]),
                      Text(
                        "EGP 320",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: KzlyColors.primaryText,
                            fontSize: 12.sp, //7.sp
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
