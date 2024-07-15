// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'florist_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FloristOrderModel _$FloristOrderModelFromJson(Map<String, dynamic> json) =>
    FloristOrderModel(
      id: json['_id'] as String?,
      customerModel: json['customer'] == null
          ? null
          : CustomerDataModel.fromJson(
              json['customer'] as Map<String, dynamic>),
      day: json['day'] as String?,
      date: json['date'] as String?,
      startHour: json['startHour'] as String?,
      endHour: json['endHour'] as String?,
      duration: json['duration'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      section: json['section'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$FloristOrderModelToJson(FloristOrderModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'customer': instance.customerModel,
      'day': instance.day,
      'date': instance.date,
      'startHour': instance.startHour,
      'endHour': instance.endHour,
      'duration': instance.duration,
      'totalPrice': instance.totalPrice,
      'section': instance.section,
      'status': instance.status,
    };

CustomerDataModel _$CustomerDataModelFromJson(Map<String, dynamic> json) =>
    CustomerDataModel(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      profilePicture: json['profilePicture'] == null
          ? null
          : ProfilePictureModel.fromJson(
              json['profilePicture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerDataModelToJson(CustomerDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'profilePicture': instance.profilePicture,
    };

ProfilePictureModel _$ProfilePictureModelFromJson(Map<String, dynamic> json) =>
    ProfilePictureModel(
      id: json['_id'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ProfilePictureModelToJson(
        ProfilePictureModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'imageUrl': instance.imageUrl,
    };
