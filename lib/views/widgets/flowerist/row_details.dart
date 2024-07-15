import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow(
      {super.key, required this.firstTilte, required this.lastTitle});
  final String firstTilte;
  final String lastTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            firstTilte,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight:
                  firstTilte == "Price" ? FontWeight.w600 : FontWeight.w500,
              color: const Color.fromRGBO(103, 96, 108, 1),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            lastTitle,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight:
                    firstTilte == "Price" ? FontWeight.w600 : FontWeight.w500,
                color: firstTilte == "Price" ? KzlyColors.primary : null),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
