import 'package:get/get.dart';

abstract class FlowristController extends GetxController {}

class FlowristControllerImp extends FlowristController {
  int pageCount = 0;
  List<String> images = [
    "assets/images/person1.png",
    "assets/images/person3.png",
    "assets/images/Ellipse.png",
    "assets/images/person2.png",
  ];
  List<String> names = [
    "Dalia Ali",
    "Khalid Sayed",
    "Abdelrahman Ali",
    "Khalid Sayed"
  ];
}
