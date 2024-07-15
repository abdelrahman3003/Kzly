// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model_back.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      details: json['details'] as Map<String, dynamic>?,
      reviews: json['reviews'] as List<dynamic>?,
      supplier: json['supplier'] as String?,
      sizes: json['sizes'] as List<dynamic>?,
      mainImage: json['mainImage'] as Map<String, dynamic>?,
      price: (json['price'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      priceDiscount: (json['priceDiscount'] as num?)?.toInt(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num?)?.toInt(),
      sold: (json['sold'] as num?)?.toInt(),
      isOutOfStock: json['isOutOfStock'] as bool?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      numOfReviews: (json['numOfReviews'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'details': instance.details,
      'reviews': instance.reviews,
      'supplier': instance.supplier,
      'sizes': instance.sizes,
      'mainImage': instance.mainImage,
      'price': instance.price,
      'currency': instance.currency,
      'priceDiscount': instance.priceDiscount,
      'category': instance.category,
      'quantity': instance.quantity,
      'sold': instance.sold,
      'isOutOfStock': instance.isOutOfStock,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'numOfReviews': instance.numOfReviews,
      'rating': instance.rating,
    };
