import 'dart:io';

import 'package:flowers_store/data/model/user/user.dart';
import 'package:flowers_store/data/source/remote/profile/profile_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_form_field/phone_form_field.dart';

abstract class MyProfileController extends GetxController {
  Future<void> pickImage(ImageSource source);

  onScure(String title);
  changePassword();
  changeformeEnable();
  saveIformation();
  getUser();
}

class MyProfileControllerImp extends MyProfileController {
  List<String> selectedSection = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeychangePassword = GlobalKey<FormState>();
  TextEditingController? nameController;
  TextEditingController? emailController;

  PhoneController phoneController1 = PhoneController(
      initialValue: const PhoneNumber(isoCode: IsoCode.EG, nsn: "011 111 11111"));
  TextEditingController? passwordController;
  TextEditingController countryController = TextEditingController(text: "Egypt");
  TextEditingController currentpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController? phoneController;
  bool isScurecurrentPassword = true;
  bool isScureNewPassword = true;
  bool isScureConfirmPassword = true;
  File? imageFile;
  bool isformEnable = false;
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest savSstatusRequest = StatusRequest.none;
  ProfileData profileData = ProfileData(Get.find());
  User user = User();
  final ImagePicker imagePicker = ImagePicker();

  @override
  void onInit() async {
    await getUser();
    nameController = TextEditingController(text: user.fullName);
    emailController = TextEditingController(text: user.email);
    phoneController = TextEditingController(text: user.phone);
    passwordController = TextEditingController(text: user.password);

    super.onInit();
  }

  @override
  onScure(String title) {
    if (title == "Current Password") {
      isScurecurrentPassword = !isScurecurrentPassword;
    } else if (title == "New Password") {
      isScureNewPassword = !isScureNewPassword;
    } else if (title == "Confirm Password") {
      isScureConfirmPassword = !isScureConfirmPassword;
    }
    update();
  }

  @override
  changePassword() {
    if (formKeychangePassword.currentState!.validate()) {}
  }

  @override
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    update();
  }

  @override
  changeformeEnable() {
    isformEnable = !isformEnable;
    update();
  }

  @override
  saveIformation() async {
    savSstatusRequest = StatusRequest.loading;
    update();
    await Future.delayed(const Duration(seconds: 1));
    savSstatusRequest = StatusRequest.success;
    Get.offAllNamed(kBottomNavigationScreen, arguments: {'pagecount': 4});
    update();
  }

  @override
  getUser() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.getUser();
    Map<String, dynamic> data = response["data"];
    if (response["status"] == "success") {
      user = User.fromJson(data);
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
