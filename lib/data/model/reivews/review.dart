import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  @JsonKey(name: '_id')
  final String id;
  final String product;
  final String user;
  final int rating;
  final String review;
  final DateTime createdAt;
  final DateTime updatedAt;

  Review.add({
    required this.product,
    required this.rating,
    required this.review,
  })   : id = '',
        user = '',
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  Review({
    required this.id,
    required this.product,
    required this.user,
    required this.rating,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
