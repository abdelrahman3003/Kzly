// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: json['_id'] as String,
      imageUrl: json['imageUrl'] as String,
      previewUrl: json['previewUrl'] as String,
      mime: json['mime'] as String,
      cloudinaryId: json['cloudinaryId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      '_id': instance.id,
      'imageUrl': instance.imageUrl,
      'previewUrl': instance.previewUrl,
      'mime': instance.mime,
      'cloudinaryId': instance.cloudinaryId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
