import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  @JsonKey(name: '_id')
  String id;
  
  String imageUrl;
  
  String previewUrl;
  
  String mime;
  
  String cloudinaryId;
  
  DateTime createdAt;
  
  DateTime updatedAt;

  Image({
    required this.id,
    required this.imageUrl,
    required this.previewUrl,
    required this.mime,
    required this.cloudinaryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
