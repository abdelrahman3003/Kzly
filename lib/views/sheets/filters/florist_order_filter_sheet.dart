import 'package:flowers_store/controllers/filter/florist_orders_filter_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/shared/filter/modules/filter_radio_button_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloristOrderFilterSheet {
  static Widget _filter() {
    return GetBuilder<FloristOrdersFilterController>(
        init: FloristOrdersFilterController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Filter'),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          FilterRadioButtonModule(
                            title: "Sort By",
                            options: controller.sorts,
                            selectedRating: controller.selectedSort,
                            onSelected: (value) => controller.updateSorts(value),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                              onPressed: () {},
                              style: ButtonThemes.secondary,
                              child: const Text('Clear',
                                  style: TextStyle(color: KzlyColors.primary))),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FilledButton(
                              onPressed: () => Get.back(),
                              style: ButtonThemes.primary,
                              child: const Text('Apply')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static void show() {
    Get.bottomSheet(
      _filter(),
      ignoreSafeArea: false,
      backgroundColor: KzlyColors.white,
      isDismissible: false,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    );
  }
}
