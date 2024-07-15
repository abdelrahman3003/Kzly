import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../widgets/custom_bottom_navigator.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return Scaffold(
        bottomNavigationBar: const AppBottomNavigatorBar(),
        body: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) {
            return SafeArea(
              child: controller.pageList[controller.pageCount]
            );
          },
        ));
  }
}
