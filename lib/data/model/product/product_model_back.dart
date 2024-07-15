import 'package:flowers_store/data/model/category/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model_back.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String description;
  final Map<String, dynamic>? details;
  final List<dynamic>? reviews;
  final String? supplier;
  final List<dynamic>? sizes;
  final Map<String, dynamic>? mainImage;
  final int? price;
  final String? currency;
  final int? priceDiscount;
  final Category? category;
  int? quantity;
  final int? sold;
  final bool? isOutOfStock;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? numOfReviews;
  final double? rating;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.details,
    required this.reviews,
    required this.supplier,
    required this.sizes,
    required this.mainImage,
    required this.price,
    required this.currency,
    required this.priceDiscount,
    required this.category,
    required this.quantity,
    required this.sold,
    required this.isOutOfStock,
    required this.createdAt,
    required this.updatedAt,
    required this.numOfReviews,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
