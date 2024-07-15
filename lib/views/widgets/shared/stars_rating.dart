import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRating extends StatelessWidget {
  final double? starSize;
  final int? itemCount;
  final VoidCallback? updateRating;
  final double? rating;
  const StarRating(
      {super.key,
      this.starSize,
      this.itemCount,
      this.updateRating,
      this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        itemSize: starSize ?? 14,
        initialRating: rating ?? 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: itemCount ?? 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: (vale) {
          updateRating;
        });
  }
}
