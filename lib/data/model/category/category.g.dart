// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String,
      isTopRated: json['isTopRated'] as bool,
      parent: json['parent'] as String?,
      name: json['name'] as String,
      depth: (json['depth'] as num).toInt(),
      children:
          (json['children'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      image: Image.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'isTopRated': instance.isTopRated,
      'parent': instance.parent,
      'name': instance.name,
      'depth': instance.depth,
      'children': instance.children,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'image': instance.image,
    };
