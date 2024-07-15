// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'florist_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FloristDataModel _$FloristDataModelFromJson(Map<String, dynamic> json) =>
    FloristDataModel(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      profilePicture: json['profilePicture'] as String?,
      work: (json['work'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FloristWorkModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      about: json['about'] as String?,
      cv: json['cv'] as String?,
      certificates: (json['certificates'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      videoURL: json['videoURL'] as String?,
      hourCost: json['hourCost'] as String?,
      section: (json['section'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      isApproved: json['isApproved'] as bool? ?? false,
      schedule: (json['schedule'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) =>
                    ScheduleTimeDataModel.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      isScheduleApproved: json['isScheduleApproved'] as bool? ?? false,
    );

Map<String, dynamic> _$FloristDataModelToJson(FloristDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'profilePicture': instance.profilePicture,
      'work': instance.work,
      'about': instance.about,
      'cv': instance.cv,
      'certificates': instance.certificates,
      'videoURL': instance.videoURL,
      'hourCost': instance.hourCost,
      'section': instance.section,
      'isApproved': instance.isApproved,
      'isScheduleApproved': instance.isScheduleApproved,
      'schedule': instance.schedule,
    };

FloristWorkModel _$FloristWorkModelFromJson(Map<String, dynamic> json) =>
    FloristWorkModel(
      id: json['_id'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$FloristWorkModelToJson(FloristWorkModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'imageUrl': instance.imageUrl,
    };
