import 'package:json_annotation/json_annotation.dart';
part 'florist_order_model.g.dart';

@JsonSerializable()
class FloristOrderModel {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'customer')
  final CustomerDataModel? customerModel;
  final String? day;
  final String? date;
  final String? startHour;
  final String? endHour;
  final String? duration;
  final int? totalPrice;
  final String? section;
  final String? status;
  FloristOrderModel(
      {this.id,
      this.customerModel,
      this.day,
      this.date,
      this.startHour,
      this.endHour,
      this.duration,
      this.totalPrice,
      this.section,
      this.status});

  factory FloristOrderModel.fromJson(Map<String, dynamic> json) =>
      _$FloristOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$FloristOrderModelToJson(this);
}

@JsonSerializable()
class CustomerDataModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? fullName;
  final String? email;
  final String? phone;
  final ProfilePictureModel? profilePicture;

  CustomerDataModel(
      {this.id, this.fullName, this.email, this.phone, this.profilePicture});
  factory CustomerDataModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDataModelToJson(this);
}

@JsonSerializable()
class ProfilePictureModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? imageUrl;

  ProfilePictureModel({required this.id, required this.imageUrl});
  factory ProfilePictureModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilePictureModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePictureModelToJson(this);
}
