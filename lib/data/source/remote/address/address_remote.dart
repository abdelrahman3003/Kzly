import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class AddressRemoteDataSource {
  Crud crud;
  AddressRemoteDataSource(this.crud);
  Future<Map> getAllAddresses({required int page}) async {
    var response = await crud.getData(
      url: getUserAddresses(pageNum: page),
    );
    return response;
  }

  Future<Map> getSpecificeAddress({required String addressId}) async {
    var response = await crud.getData(
      url: createSpecificAddress(id: addressId),
    );
    return response;
  }

  Future<Map> createOrdinaryAddress(
      {required String country,
      required String state,
      required String city,
      required String street,
      required int buildingNumber,
      required int floorNumber,
      required int apartmentNumber,
      required String homeDescription}) async {
    var response = await crud.postData(url: createOrdinaryAddressNameLink, data: {
      "country": country,
      "state": state,
      "city": city,
      "street": street,
      "buildingNumber": buildingNumber,
      "floorNumber": floorNumber,
      "apartmentNumber": apartmentNumber,
      "homeDescription": homeDescription
    });
    return response;
  }

  Future deleteSpecificAddress({required String addressId}) async {
    var response = await crud.deleteData(url: createDeleteAddress(id: addressId));
    return response;
  }
}
