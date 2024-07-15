import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class AppbarItem extends StatelessWidget {
  const AppbarItem({
    super.key,
    this.iconName = "",
    required this.icon,
    required this.isactive,
  });
  final String iconName;
  final String icon;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () {
            if (iconName == "Favourite") {
              controller.changepage(1);
            } else if (iconName == "Cart") {
              controller.changepage(2);
            } else if (iconName == "Profile") {
              controller.changepage(3);
            } else {
              controller.changepage(0);
            }
          },
          child: Column(
            children: [
              SvgPicture.asset(
                icon,
                semanticsLabel: 'Acme Logo',
                width: 24,
              ),
              Text(iconName),
              Container(
                  height: 3,
                  width: 50,
                  decoration: isactive
                      ? const BoxDecoration(color: Colors.black)
                      : null)
            ],
          ),
        ),
      ),
    );
  }
}
