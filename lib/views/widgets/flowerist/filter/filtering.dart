import 'package:flowers_store/controllers/filter_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/flowerist/filter/checkbox_section.dart';
import 'package:flowers_store/views/widgets/flowerist/filter/custom_dropdown_button.dart';
import 'package:flowers_store/views/widgets/flowerist/filter/filter_listtile_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Filtering extends StatelessWidget {
  const Filtering({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterControllerImp>(builder: (filterController) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Center(
                  child: Text(
                    "Filter",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Text(
                "Section",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  CheckBoxSection(
                    title: "Events",
                    value: filterController.isEvents,
                  ),
                  CheckBoxSection(
                    title: "Wedding",
                    value: filterController.isWedding,
                  ),
                  CheckBoxSection(
                    title: "Bouqet",
                    value: filterController.isBouqet,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Your budget per hour",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SfRangeSlider(
                showTicks: true,
                showLabels: true,
                min: 100,
                max: 1500.0,
                values: filterController.budgetValue,
                dividerShape: const SfDividerShape(),
                showDividers: true,
                interval: 700,
                enableTooltip: true,
                onChanged: (dynamic newValue) {
                  filterController.changeSilder(newValue);
                },
                activeColor: KzlyColors.primary,
              ),
              const SizedBox(height: 21),
              Text(
                "Choose Date",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                readOnly: true,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    hintText: "Choose date for appointment",
                    prefixIcon: Icon(
                      SolarIconsOutline.calendar,
                    )),
                controller: filterController.textEditingController,
                onTap: () async {
                  filterController.selectDate(context);
                },
              ),
              const SizedBox(height: 8),
              Text(
                "Select Time",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              CustomDropdownButton(
                items: filterController.times,
                onChanged: (val) {
                  filterController.onChangeDropDownTime(val!);
                },
                hinttext: "Select Day",
                value: filterController.timeValue,
              ),
              const SizedBox(height: 16),
              Text(
                "Rating",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const FilterListtileRadio(value: "All", numGoldStar: 5, title: "All"),
              const FilterListtileRadio(value: "5", numGoldStar: 5, title: "only"),
              const FilterListtileRadio(value: "4", numGoldStar: 4, title: "up"),
              const FilterListtileRadio(value: "3", numGoldStar: 3, title: "up"),
              const FilterListtileRadio(value: "2", numGoldStar: 2, title: "up"),
              const FilterListtileRadio(
                value: "1",
                numGoldStar: 1,
                title: "and up",
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 16),
                  child: FilledButton(
                    style: ButtonThemes.primary.copyWith(
                        fixedSize: WidgetStatePropertyAll(Size(Get.width * .8, 48))),
                    child: Text("Save",
                        style:
                            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
