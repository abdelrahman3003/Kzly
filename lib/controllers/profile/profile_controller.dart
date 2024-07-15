import 'package:flowers_store/data/model/user/user.dart';
import 'package:flowers_store/data/source/remote/auth/logOut_data.dart';
import 'package:flowers_store/data/source/remote/profile/profile_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController {
  logout();
  getUser();
}

class ProfileControllerImp extends ProfileController {
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  bool getuserType = false;
  LogOutData logOutData = LogOutData(Get.find());
  User user = User();
  ProfileData profileData = ProfileData(Get.find());
  @override
  void onInit() async {
    await getUser();
    super.onInit();
  }

  @override
  logout() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await logOutData.logout();
    if (response["status"] == "success") {
      appServices.sharedPreferences.setString("step", "1");
      statusRequest = StatusRequest.success;
      Get.offAllNamed(kWelcomePage);
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  getUser() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.getUser();
    if (response["status"] == "success") {
      user = User.fromJson(response["data"]);
      statusRequest = StatusRequest.success;
      getuserType = true;
    } else {
      if (response["status"] == "offline") {
        statusRequest = StatusRequest.offlineFailure;
        GetSnackBar(
            title: StatusRequest.offlineFailure.name.capitalizeFirst,
            message: response["data"]["message"],
            duration: const Duration(seconds: 5),
            backgroundColor: KzlyColors.black);
      } else {
        statusRequest = StatusRequest.failure;
        GetSnackBar(
            title: StatusRequest.failure.name.capitalizeFirst,
            message: response["data"]["message"],
            duration: const Duration(seconds: 5),
            backgroundColor: KzlyColors.black);
      }
    }
    update();
  }
}
