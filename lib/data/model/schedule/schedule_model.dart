import 'package:json_annotation/json_annotation.dart';
part 'schedule_model.g.dart';

@JsonSerializable()
class ScheduleModel {
  final String? message;
  final Map<String, List<ScheduleTimeDataModel>>? data;
  ScheduleModel({required this.message, required this.data});
  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);
}

@JsonSerializable()
class ScheduleTimeDataModel {
  @JsonKey(name: '_id')
  final String? id;
  String? startHour;
  String? endHour;
  ScheduleTimeDataModel({this.id, this.startHour, this.endHour});
  factory ScheduleTimeDataModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleTimeDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleTimeDataModelToJson(this);
}
