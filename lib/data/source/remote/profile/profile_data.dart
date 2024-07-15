import 'dart:io';

import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);
  getUser() async {
    var response = await crud.getData(
      url: getUserNameLink,
    );
    return response;
  }

  getFloristInfo() async {
    var response = await crud.getData(
      url: getFoloristInfoNameLink,
    );
    return response;
  }

  uploadWorkImage({required File file}) async {
    var response = await crud.patchFile(
      url: uploadFloristWorkImageNameLink,
      file: file,
    );
    return response;
  }

  uploadFloristInfo({required Map data}) async {
    var response = await crud.patchData(url: getFoloristInfoNameLink, data: data);
    return response;
  }

  deleteWorkImage({required String id}) async {
    var response =
        await crud.deleteData(url: deleteFloristWorkImageNameLink(id: id));
    return response;
  }

  uploadFloristSchedule({required Map<String, dynamic> data}) async {
    var response = await crud.postData(url: createScheduleNameLink, data: data);
    return response;
  }

  deleteSchedule({required String id}) async {
    var response = await crud.deleteData(url: deleteScheduleNameLink(id: id));
    return response;
  }

  editFloristSchedule({required Map<String, dynamic> data}) async {
    var response = await crud.patchData(url: createScheduleNameLink, data: data);
    return response;
  }

  getFloristListOrders({required String search, required String status}) async {
    var response = await crud.getData(
        url: getFloristOrdersNameLink(search: search, status: status));
    return response;
  }
}
