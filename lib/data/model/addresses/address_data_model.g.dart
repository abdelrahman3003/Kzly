// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDataModel _$AddressDataModelFromJson(Map<String, dynamic> json) =>
    AddressDataModel(
      id: json['id'] as String,
      addressType: json['addressType'] as String,
      owner: json['owner'] as String,
      homeDescription: json['homeDescription'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      buildingNumber: (json['buildingNumber'] as num).toInt(),
      floorNumber: (json['floorNumber'] as num).toInt(),
      apartmentNumber: (json['apartmentNumber'] as num).toInt(),
    );

Map<String, dynamic> _$AddressDataModelToJson(AddressDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addressType': instance.addressType,
      'owner': instance.owner,
      'homeDescription': instance.homeDescription,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'buildingNumber': instance.buildingNumber,
      'floorNumber': instance.floorNumber,
      'apartmentNumber': instance.apartmentNumber,
    };
