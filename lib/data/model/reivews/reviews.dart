import 'package:flowers_store/data/model/reivews/review.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reviews.g.dart';

@JsonSerializable(explicitToJson: true)
class Reviews {
  final String message;
  final List<Review> data;

  Reviews({
    required this.message,
    required this.data,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => _$ReviewsFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}
