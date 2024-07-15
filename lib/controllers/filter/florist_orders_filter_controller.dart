import 'package:get/get.dart';

class FloristOrdersFilterController extends GetxController {
  List<String> sorts = [];
  int selectedSort = 0;

  @override
  void onInit() {
    sorts = [
      'All',
      'Done',
      'Pending',
      'Declined',
    ];
    super.onInit();
  }

  void updateSorts(int value) {
    selectedSort = value;
    update();
  }
}
