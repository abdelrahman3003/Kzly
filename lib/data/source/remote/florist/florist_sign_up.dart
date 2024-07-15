import 'dart:io';

import 'package:flowers_store/data/model/florist/florist_register.dart';
import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class FloristSignUp {
  Crud crud;
  FloristSignUp(this.crud);
  floristSignUp(
      {required FloristRegister floristData,
      required List<String> certifications,
      required File cv}) async {
    var response = await crud.postRequsetWithMultiFiles(
        url: floristSignupNameLink,
        data: floristData,
        certificates: certifications,
        cvFile: cv);
    return response;
  }
}
