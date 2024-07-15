import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchbarFlowrist extends StatelessWidget {
  const CustomSearchbarFlowrist(
      {super.key,
      required this.onSubmit,
      this.backgroundColor,
      this.searchIconColor,
      this.textColor});
  final Function(String)? onSubmit;
  final Color? backgroundColor;
  final Color? searchIconColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: SearchBar(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        elevation: const WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Adjust border radius as needed
            side: const BorderSide(
              color: Color.fromRGBO(151, 146, 154, 1),
              width: 1.0,
            ),
          ),
        ),
        leading: SvgPicture.asset(
          "assets/icons/search.svg",
          width: 20,
          color: searchIconColor ?? Colors.grey,
        ),
        hintText: "Search",
        textStyle: WidgetStatePropertyAll(
            TextStyle(color: textColor ?? KzlyColors.black, fontSize: 14)),
        hintStyle: WidgetStatePropertyAll(
            TextStyle(color: textColor ?? KzlyColors.secondryText, fontSize: 14)),
        padding: const WidgetStatePropertyAll(EdgeInsets.only(left: 16, right: 8)),
        onSubmitted: onSubmit,
      ),
    );
  }
}
