import 'package:flowers_store/data/model/image/image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  String id;
  bool isTopRated;
  String? parent;
  String name;
  int depth;
  List<String> children;
  DateTime createdAt;
  DateTime updatedAt;
  Image image;

  Category({
    required this.id,
    required this.isTopRated,
    this.parent,
    required this.name,
    required this.depth,
    required this.children,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
