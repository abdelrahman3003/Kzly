import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedProductCard extends StatelessWidget {
  const RelatedProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 88.w,
      height: 110.h,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "White Flowers",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " Vas ",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Text(
                " 124 \$",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
              )
            ],
          )
        ],
      ),
    );
  }
}
