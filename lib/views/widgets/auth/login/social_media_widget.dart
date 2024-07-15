// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaWidget extends StatelessWidget {
  final Color? borderColor;
 final String  image;
 final Function()? onTap;
  const SocialMediaWidget({
    super.key,
    this.borderColor,
    this.onTap,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56.w,
        height:56.h,
        alignment:AlignmentDirectional.center,
        decoration: BoxDecoration(
          border:Border.all(color:borderColor??const Color.fromRGBO(226, 232, 240, 1),width: 2.w),
          shape:BoxShape.circle
        ),
        child: SvgPicture.asset(image),
       
      ),
    );
  }
}
