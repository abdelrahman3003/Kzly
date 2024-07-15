import 'package:flowers_store/data/model/product/product_model_back.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: '_id')
  String? id;
  Product? product;
  int? quantity;
  int? totalPrice;
  String? createdAt;
  String? updatedAt;
  bool isIncheckOut;
  Cart({
    this.id,
    this.product,
    this.quantity,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.isIncheckOut = true,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
