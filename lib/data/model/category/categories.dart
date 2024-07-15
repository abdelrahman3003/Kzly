import 'package:json_annotation/json_annotation.dart';
import 'category.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories {
  String message;
  List<Category> data;

  Categories({
    required this.message,
    required this.data,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
