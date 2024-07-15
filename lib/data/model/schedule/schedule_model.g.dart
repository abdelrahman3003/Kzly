// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel(
      message: json['message'] as String?,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) =>
                    ScheduleTimeDataModel.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$ScheduleModelToJson(ScheduleModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

ScheduleTimeDataModel _$ScheduleTimeDataModelFromJson(
        Map<String, dynamic> json) =>
    ScheduleTimeDataModel(
      id: json['_id'] as String?,
      startHour: json['startHour'] as String?,
      endHour: json['endHour'] as String?,
    );

Map<String, dynamic> _$ScheduleTimeDataModelToJson(
        ScheduleTimeDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'startHour': instance.startHour,
      'endHour': instance.endHour,
    };
