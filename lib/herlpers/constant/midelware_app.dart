import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routsApp.dart';

class AppMiddleWare extends GetMiddleware {
  @override
  int? priority = 0;
  AppServices appServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (appServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: kBottomNavigationScreen);
    }
    if (appServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: kWelcomePage);
    }

    return null;
  }
}
