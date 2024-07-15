import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloristFilterController extends GetxController {
  final Map<String, bool> sections = <String, bool>{};
  final Map<String, bool> categories = <String, bool>{};
  RangeValues? priceRange;
  RangeValues priceRangeValue = const RangeValues(0, 100);
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
      'Birthday': false,
      'Anniversary': false,
      'Funeral': false,
      'Others': false,
    });
    priceRange = const RangeValues(0, 100);
    super.onInit();
  }

  void updateSections(Map<String, bool>? value) {
    sections.addAll(value!);
    update();
  }

  void updateCategories(Map<String, bool>? value) {
    categories.addAll(value!);
    update();
  }

  void updatePriceRange(RangeValues value) {
    priceRangeValue = value;
    update();
  }

  void updateRating(int value) {
    selectedRating = value;
    update();
  }
}
