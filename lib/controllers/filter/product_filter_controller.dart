import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductFilterController extends GetxController {
  final Map<String, bool> availability = <String, bool>{};
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
    categories.addAll({
      'Flowers': true,
      'Plants': false,
      'Bouquets': false,
      'Vases': false,
      'Pots': false,
      'Gifts': false,
      'Accessories': false,
      'Others': false,
      'All': true,
    });
    availability.addAll({
      'Out of Stock': false,
    });
    priceRange = const RangeValues(0, 100);
    super.onInit();
  }

  void updateAvailability(Map<String, bool>? value) {
    availability.addAll(value!);
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
