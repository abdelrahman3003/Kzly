// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'florist_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FloristRegister _$FloristRegisterFromJson(Map<String, dynamic> json) =>
    FloristRegister(
      fullName: json['fullName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      gender: json['gender'] as String,
      nationalId: json['floristView[nationalId]'] as String?,
      videoURL: json['floristView[videoURL]'] as String?,
      section: (json['floristView[section]'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$FloristRegisterToJson(FloristRegister instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'floristView[nationalId]': instance.nationalId,
      'floristView[videoURL]': instance.videoURL,
      'floristView[section]': instance.section,
    };
