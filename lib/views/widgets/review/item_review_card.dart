import 'package:flowers_store/data/model/reivews/review.dart';
import 'package:flowers_store/herlpers/function/times_ago.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewListTile extends StatelessWidget {
  final Review review;
  const ReviewListTile({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          'https://xsgames.co/randomusers/avatar.php?g=male',
          fit: BoxFit.cover,
        ),
      ),
      title: const Text(
        "John Doe",
        style: TextStyle(
          color: Color(0xFF1A0429),
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      isThreeLine: true,
      trailing: Text(
        TimesAgo.convert(review.createdAt),
        style: const TextStyle(
          color: Color(0xFFB8B4BA),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingBar.builder(
            itemSize: 14,
            initialRating: review.rating.toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            ignoreGestures: true,
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
            review.review,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF1A0429),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
