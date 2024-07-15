import 'dart:developer';

import 'package:get/get.dart';

class LanguageController extends GetxController {
  List<Map<String, dynamic>> languageList = [
    {
      "id": 1,
      "language": "العربية",
      "flag": "https://cdn.britannica.com/79/5779-004-DC479508/Flag-Saudi-Arabia.jpg"
    },
    {
      "id": 2,
      "language": "English",
      "flag":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_United_Kingdom_%283-5%29.svg/1200px-Flag_of_the_United_Kingdom_%283-5%29.svg.png"
    },
    {
      "id": 3,
      "language": "Argentina",
      "flag":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/2000px-Flag_of_Argentina.svg.png"
    },
    {
      "id": 4,
      "language": "Germany",
      "flag":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/280px-Flag_of_Germany.svg.png"
    },
    {
      "id": 5,
      "language": "Australia",
      "flag":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Flag_of_Australia.svg/2560px-Flag_of_Australia.svg.png"
    },
    {
      "id": 6,
      "language": "Turkey",
      "flag":
          "https://s3.eu-west-2.amazonaws.com/qmasters/flags/png/turkey/flag-400.png"
    },
    {
      "id": 7,
      "language": "Afghanistan",
      "flag":
          "https://www.alaraby.com/sites/default/files/styles/d08/public/2021-08/Capture_2.JPG?itok=rgnq6aQ_"
    },
    {
      "id": 8,
      "language": "Belgium",
      "flag":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Belgium.svg/280px-Flag_of_Belgium.svg.png"
    },
    {
      "id": 9,
      "language": "Brazil",
      "flag":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/280px-Flag_of_Brazil.svg.png"
    },
    {
      "id": 10,
      "language": "Portugal",
      "flag":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoZ2lWTHJqKgLK_aIYCDfPbGMBuo87vQ4XKQ&s"
    }
  ];
  List<Map<String, dynamic>> displayList = [];
  String? languagechoice;
  @override
  void onInit() {
    super.onInit();
    displayList = [...languageList];
    languagechoice = "English";
  }

  void selectlanguage(String selectedlang) {
    log(selectedlang.toString());
    languagechoice = selectedlang;
    update();
  }

  void searchinglanguages(String searchingvalue) {
    log(searchingvalue);
    displayList = languageList
        .where((element) => element["language"]
            .toString()
            .toLowerCase()
            .contains(searchingvalue.toString().toLowerCase()))
        .toList();
    update();
  }
}
