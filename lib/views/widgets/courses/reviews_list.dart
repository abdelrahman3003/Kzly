import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/widgets/review/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Reviews",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: KzlyColors.purpleBlack),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(kAllReviewsPage);
              },
              child: Text(
                "See all",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: KzlyColors.purple),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 128.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            controller: ScrollController(),
            padding: const EdgeInsets.all(8),
            itemCount: 20,
            itemBuilder: (context, index) => const ReviewCard(),
          ),
        ),
      ],
    );
  }
}
