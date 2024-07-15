import 'package:flowers_store/data/model/schedule/schedule_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'florist_data_model.g.dart';

@JsonSerializable()
class FloristDataModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? profilePicture;
  final List<FloristWorkModel?> work;
  final String? about;
  final String? cv;
  final List<String?> certificates;
  final String? videoURL;
  final String? hourCost;
  final List<String?> section;
  final bool isApproved;
  final bool isScheduleApproved;
  final Map<String,List<ScheduleTimeDataModel>>? schedule;

  FloristDataModel(
      {this.id,
      this.fullName,
      this.email,
      this.phone,
      this.profilePicture,
      this.work = const [],
      this.about,
      this.cv,
      this.certificates = const [],
      this.videoURL,
      this.hourCost,
      this.section = const [],
      this.isApproved = false,
      this.schedule,
      this.isScheduleApproved = false});

  factory FloristDataModel.fromJson(Map<String, dynamic> json) =>
      _$FloristDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FloristDataModelToJson(this);
}

@JsonSerializable()
class FloristWorkModel {
  @JsonKey(name: '_id')
  final String id;
  final String imageUrl;
  const FloristWorkModel({required this.id,required this.imageUrl});
  factory FloristWorkModel.fromJson(Map<String, dynamic> json) =>
      _$FloristWorkModelFromJson(json);
  Map<String, dynamic> toJson() => _$FloristWorkModelToJson(this);
}
