import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesFilterController extends GetxController {
  final Map<String, bool> availability = <String, bool>{};
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
    availability.addAll({
      'Online': true,
      'On-Site': false,
      'Hybrid': false,
    });
    sections.addAll({
      'Event': false,
      'Wedding': false,
      'Bouquet': false,
    });
    categories.addAll({
      'Flower': false,
      'Plant': false,
      'Gift': false,
      'Accessories': false,
    });
    priceRange = const RangeValues(0, 100);
    super.onInit();
  }

  updateSections(Map<String, bool>? value) {
    sections.addAll(value!);
    update();
  }

  updateCategories(Map<String, bool>? value) {
    categories.addAll(value!);
    update();
  }

  updateAvailability(Map<String, bool>? value) {
    availability.addAll(value!);
    update();
  }

  updatePriceRange(RangeValues value) {
    priceRangeValue = value;
    update();
  }

  void updateRating(int value) {
    selectedRating = value;
    update();
  }
}
