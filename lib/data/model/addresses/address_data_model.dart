import 'package:json_annotation/json_annotation.dart';
part 'address_data_model.g.dart';

@JsonSerializable()
class AddressDataModel {
  final String id;
  final String addressType;
  final String owner;
  final String homeDescription;
  final String street;
  final String city;
  final String state;
  final String country;
  final int buildingNumber;
  final int floorNumber;
  final int apartmentNumber;
  AddressDataModel(
      {required this.id,
      required this.addressType,
      required this.owner,
      required this.homeDescription,
      required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.buildingNumber,
      required this.floorNumber,
      required this.apartmentNumber});

  factory AddressDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddressDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDataModelToJson(this);
}
