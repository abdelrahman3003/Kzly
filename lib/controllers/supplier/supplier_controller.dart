import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';


abstract class SupplierController extends GetxController {
  Future<void> uploadExcelFile();
  Future<void> downloadExcelFile();
}

class SupplierControllerImp extends SupplierController {
  List<Map<String, dynamic>> rowList = [
    {
      "price": "200 EGP",
      "status": "approved",
      "notes":
          'Some long content i would like to be wrapped when column width is not enought to fully display itSome long content i would like to be wrapped when column width is not display it Some long content i would like to be wrapped when column width is not enought to fully display itSome long content i would like to be wrapped when column width is not display it Some long content i would like to be wrapped when column width is not enought to fully display itSome long content i would like to be wrapped when column width is not display it 555'
    },
    {"price": "3020 EGP", "status": "pending", "notes": "Waiting"},
    {
      "price": "210 EGP",
      "status": "declined",
      "notes": "Doesn't Suitable for us we will contact with you soon"
    },
    {
      "price": "290 EGP",
      "status": "approved",
      "notes": "Welcome Sir in Our Application"
    },
    {"price": "7000 EGP", "status": "pending", "notes": "Waiting"},
    {"price": "7505 EGP", "status": "approved", "notes": "Welcome Sir "},
    {
      "price": "805 EGP",
      "status": "declined",
      "notes": "Doesn't Suitable for us This Offer"
    },
    {"price": "9505 EGP", "status": "approved", "notes": "Your Offer is Accepted"},
    {"price": "3070 EGP", "status": "declined", "notes": "Your Offer is Rejected"},
    {
      "price": "3756 EGP",
      "status": "pending",
      "notes":'Waiting'
    },
    {
      "price": "287 EGP",
      "status": "approved",
      "notes": "Your Offer Suitable with me"
    }
  ];

  @override
  Future<void> uploadExcelFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        withReadStream: true,
        type: FileType.custom,
        allowedExtensions: ['xls', 'xlsx'],
      );
      if (result != null) {
        for (var files in result.files) {
          log("Path:${files.path!}");
          log("Name:${files.name}");
        }
      } else {
        ///make Here any thing
      }
      update();
    } catch (error) {
      log("Error:$error");
    }
  }

  @override
  Future<void> downloadExcelFile() {
    // TODO: implement downloadExcelFile
    throw UnimplementedError();
  }
}
