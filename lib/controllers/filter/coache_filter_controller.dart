import 'package:get/get.dart';

class CoachesFilterController extends GetxController {
  final Map<String, bool> sections = <String, bool>{};
  List<String> ratings = [];
  int selectedRating = 0;

  @override
  void onInit() {
    ratings = [
      '⭐⭐⭐⭐ & Up',
      '⭐⭐⭐ & Up',
      '⭐⭐ & Up',
      '⭐ & Up',
    ];
    sections.addAll({
      'Event': false,
      'Wedding': false,
      'Bouquet': false,
    });
    super.onInit();
  }

  updateSections(Map<String, bool>? value) {
    sections.addAll(value!);
    update();
  }

  void updateRating(int value) {
    selectedRating = value;
    update();
  }
}
