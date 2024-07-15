import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../herlpers/constant/colors.dart';

class ItemRate extends StatelessWidget {
  const ItemRate(
      {super.key,
      required this.price,
      required this.rate,
      required this.isInsack});
  final String price;
  final double rate;
  final bool isInsack;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "White Flower Vas",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  RatingBar.builder(
                    itemSize: 14,
                    initialRating: rate,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Text(" 5/${rate.toInt()}",
                      style: const TextStyle(fontSize: 10)),
                  Opacity(
                    opacity: .3,
                    child:
                        Text(" (Reviews)", style: TextStyle(fontSize: 10.sp)),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text("EGP $price",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: KzlyColors.primary,
                      fontWeight: FontWeight.bold)),
              Text(isInsack ? "In Stack" : "Out of Stock",
                  style: TextStyle(fontSize: 10.sp, color: KzlyColors.green)),
            ],
          ),
        ],
      ),
    );
  }
}
