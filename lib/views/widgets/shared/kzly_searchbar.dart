import 'package:flowers_store/herlpers/class/extentions.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solar_icons/solar_icons.dart';

class KzlySearchBar extends StatelessWidget {
  const KzlySearchBar(
      {super.key,
      required this.onSubmit,
      this.backgroundColor,
      this.searchIconColor,
      this.textColor,
      this.borderColor,
      this.onFilterPressed,
      this.borderRadius,
      this.onNotificationPressed,
      this.onSortPressed,
      this.options});
  final Function(String)? onSubmit;
  final Color? backgroundColor;
  final Color? searchIconColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final Function()? onFilterPressed;
  final Function()? onNotificationPressed;
  final Function(String)? onSortPressed;
  final List<String>? options;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SearchBar(
              backgroundColor:
                  WidgetStatePropertyAll(backgroundColor ?? KzlyColors.white),
              elevation: const WidgetStatePropertyAll(0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      borderRadius ?? 10), // Adjust border radius as needed
                  side: BorderSide(
                    color: borderColor ?? Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              leading: SvgPicture.asset(
                "assets/icons/search.svg",
                width: 20.w,
                color: searchIconColor ?? Colors.grey,
              ),
              hintText: "Search",
              textStyle: WidgetStatePropertyAll(
                  TextStyle(color: textColor ?? KzlyColors.black, fontSize: 14.sp)),
              hintStyle: WidgetStatePropertyAll(TextStyle(
                color: textColor ?? KzlyColors.secondryText,
                fontSize: 14.sp,
              )),
              padding:
                  WidgetStatePropertyAll(EdgeInsets.only(left: 16.w, right: 8.w)),
              onSubmitted: onSubmit,
            ),
          ),
          (onFilterPressed != null || onNotificationPressed != null)
              ? const SizedBox(width: 8)
              : const SizedBox(width: 0),
          Row(
            children: [
              onFilterPressed != null
                  ? IconButton.outlined(
                      style: ButtonThemes.outlineIconButton,
                      onPressed: onFilterPressed,
                      icon: const Icon(
                        SolarIconsOutline.filter,
                      ))
                  : const SizedBox(width: 0),
              onNotificationPressed != null
                  ? IconButton.outlined(
                      style: ButtonThemes.outlineIconButton,
                      onPressed: onNotificationPressed,
                      icon: const Icon(
                        SolarIconsOutline.bellBing,
                      ))
                  : const SizedBox(width: 0),
              onSortPressed != null && options != null
                  ? PopupMenuButton<String>(
                      initialValue: options?.first,
                      onSelected: onSortPressed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: KzlyColors.backgroundColor,
                      surfaceTintColor: KzlyColors.backgroundColor,
                      splashRadius: 0,
                      itemBuilder: (BuildContext context) {
                        return options!.map((String option) {
                          return PopupMenuItem<String>(
                            value: option,
                            child: Text(option.capitalize()),
                          );
                        }).toList();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        height: 48.h,
                        width: 42.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor ?? Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          SolarIconsOutline.sort,
                        ),
                      ),
                    )
                  : const SizedBox(width: 0),
            ],
          )
        ],
      ),
    );
  }
}
