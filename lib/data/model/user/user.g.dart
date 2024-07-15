// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
      isVerified: json['isVerified'] as bool?,
      isSuspended: json['isSuspended'] as bool?,
      isActive: json['isActive'] as bool?,
      gender: json['gender'] as String?,
      isFlorist: json['isFlorist'] as bool? ?? false,
      isSupplier: json['isSupplier'] as bool? ?? false,
      isCoach: json['isCoach'] as bool? ?? false,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      passwordChangedAt: json['passwordChangedAt'] as String?,
      profilePicture: json['profilePicture'] as Map<String, dynamic>?,
      profiles: (json['profiles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'role': instance.role,
      'isVerified': instance.isVerified,
      'isSuspended': instance.isSuspended,
      'isActive': instance.isActive,
      'gender': instance.gender,
      'isFlorist': instance.isFlorist,
      'isSupplier': instance.isSupplier,
      'isCoach': instance.isCoach,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'passwordChangedAt': instance.passwordChangedAt,
      'profilePicture': instance.profilePicture,
      'profiles': instance.profiles,
    };
