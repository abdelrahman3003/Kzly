import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class RatingSummary extends StatelessWidget {
  final List<double> ratings;
  final double averageRating;
  final int numberOfReviews;
  final Function()? onTapWriteReview;
  const RatingSummary(
      {super.key,
      required this.ratings,
      required this.averageRating,
      required this.numberOfReviews,
      this.onTapWriteReview});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(averageRating.toString(),
                    style: const TextStyle(
                      color: Color(0xFF240637),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: 4),
                RatingBar.builder(
                  itemSize: 14,
                  initialRating: averageRating,
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
                const SizedBox(height: 4),
                Text(
                  '$numberOfReviews Reviews',
                  style: const TextStyle(
                    color: Color(0xFF675F6C),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
                child: Column(
              children: ratings
                  .map((e) => RatingProgressIndicator(
                      value: e, leading: '${ratings.indexOf(e) + 1} ⭐'))
                  .toList(),
            )),
          ],
        ),
        onTapWriteReview != null
            ? const SizedBox(height: 16)
            : const SizedBox.shrink(),
        onTapWriteReview != null
            ? FilledButton(
                onPressed: onTapWriteReview,
                style: ButtonThemes.secondary.copyWith(
                    fixedSize: WidgetStateProperty.all(Size(Get.width, 48))),
                child: const Text("Write a Review",
                    style: TextStyle(color: KzlyColors.primary)),
              )
            : const SizedBox.shrink(),
        onTapWriteReview != null
            ? const SizedBox(height: 16)
            : const SizedBox.shrink(),
      ],
    );
  }
}

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator(
      {super.key, required this.value, required this.leading});
  final double value;
  final String leading;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(leading, style: const TextStyle(color: Color(0xFF240637))),
            const SizedBox(width: 8),
            Expanded(
              child: LinearProgressIndicator(
                value: value,
                minHeight: 5,
                backgroundColor: KzlyColors.secondry,
                borderRadius: BorderRadius.circular(20),
                valueColor: const AlwaysStoppedAnimation<Color>(KzlyColors.primary),
              ),
            ),
            const SizedBox(width: 8),
            Text('${(value * 100).toInt()}%',
                style: const TextStyle(color: Color(0xFF240637))),
          ],
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
