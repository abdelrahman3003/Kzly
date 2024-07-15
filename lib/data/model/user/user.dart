import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  String? id;
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? role;
  bool? isVerified;
  bool? isSuspended;
  bool? isActive;
  String? gender;
  bool isFlorist;
  bool isSupplier;
  bool isCoach;
  String? createdAt;
  String? updatedAt;
  String? passwordChangedAt;
  Map<String, dynamic>? profilePicture;
  List<String>? profiles;

  User({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.role,
    this.isVerified,
    this.isSuspended,
    this.isActive,
    this.gender,
    this.isFlorist =false,
    this.isSupplier =false,
    this.isCoach =false,
    this.createdAt,
    this.updatedAt,
    this.passwordChangedAt,
    this.profilePicture,
    this.profiles,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
