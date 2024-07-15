import 'package:flowers_store/controllers/filter/florist_filter_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/shared/filter/modules/date_selector_module.dart';
import 'package:flowers_store/views/widgets/shared/filter/modules/drop_down_menu_module.dart';
import 'package:flowers_store/views/widgets/shared/filter/modules/filter_checkbox_module.dart';
import 'package:flowers_store/views/widgets/shared/filter/modules/filter_radio_button_module.dart';
import 'package:flowers_store/views/widgets/shared/filter/modules/filter_range_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloristFilterSheet {
  static Widget _filter() {
    return GetBuilder<FloristFilterController>(
        init: FloristFilterController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Filters'),
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
                          FilterCheckboxModule(
                            title: "Section",
                            options: controller.sections,
                            onChanged: (value) => controller.updateSections(value),
                          ),
                          const SizedBox(height: 16),
                          FilterRangeModule(
                            title: "Your Budget (per hour)",
                            trailing: "/hr",
                            range: controller.priceRange,
                            value: controller.priceRangeValue,
                            onChanged: (value) => controller.updatePriceRange(value),
                          ),
                          const SizedBox(height: 16),
                          DateSelectorModule(
                              title: "Select Date",
                              onChanged: (value) {
                                print(value);
                              }),
                          const SizedBox(height: 10),
                          DropdownMenuModule(
                            title: "Select Time",
                            initialItem: '1pm-3pm',
                            items: const [
                              '1pm-3pm',
                              '3pm-5pm',
                              '5pm-7pm',
                              '7pm-9pm',
                            ],
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 16),
                          FilterRadioButtonModule(
                              title: "Rating",
                              options: controller.ratings,
                              selectedRating: controller.selectedRating,
                              onSelected: (value) => controller.updateRating(value)),
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
