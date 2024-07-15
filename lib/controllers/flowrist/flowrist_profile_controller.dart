import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FlowristInProfileController extends GetxController {
  onChangeDropDownSection(String val);
  onChangeDropDownTime(String val);
  Future<void> selectDate(BuildContext context);
}

class FlowristInProfileControllerImp extends FlowristInProfileController {
  List<String> sections = [
    'Wedding',
    'event',
    'bouqet',
    'marraging',
  ];
  List<String> times = [
    '9am - 5pm',
    '12am - 7pm',
    '10am - 2pm',
    '7 am - 1pm',
    '10am - 5pm',
    '11am - 4pm'
  ];
  String sectionValue = "";
  String timeValue = "";
  DateTime selectedDate = DateTime.now();
  TextEditingController textEditingController = TextEditingController();
  @override
  onChangeDropDownSection(String val) {
    sectionValue = val.toString();
    update();
  }

  @override
  onChangeDropDownTime(String val) {
    timeValue = val.toString();
    update();
  }

  @override
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: KzlyColors.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    textEditingController.text = "${selectedDate.toLocal()}".split(' ')[0];
  }
}
