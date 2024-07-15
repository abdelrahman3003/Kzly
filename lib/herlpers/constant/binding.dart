import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
