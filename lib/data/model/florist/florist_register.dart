import 'package:json_annotation/json_annotation.dart';
part 'florist_register.g.dart';

@JsonSerializable()
class FloristRegister {
  final String fullName;
  final String phone;
  final String email;
  final String password;
  final String gender;
  @JsonKey(name: 'floristView[nationalId]')
  final String? nationalId;
  @JsonKey(name: 'floristView[videoURL]')
  final String? videoURL;
  @JsonKey(name: 'floristView[section]')
  final List<String?>? section;
  FloristRegister(
      {required this.fullName,
      required this.phone,
      required this.email,
      required this.password,
      required this.gender,
      required this.nationalId,
      required this.videoURL,
      this.section});
  factory FloristRegister.fromJson(Map<String, dynamic> json) =>
      _$FloristRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$FloristRegisterToJson(this);
}
