import 'package:flowers_store/controllers/payment/payment_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPaymentController extends GetxController {
  final formKey = GlobalKey<FormState>();
  int? index;
  TextEditingController cardNameHolderController = TextEditingController();
  TextEditingController cardExpiryController = TextEditingController();

  @override
  void onInit() {
    index = Get.arguments['index'];
    if (index != null) {
      cardNameHolderController.text = paymentInfo[index!]['holderName'];
      cardExpiryController.text = paymentInfo[index!]['expiryDate'];
    }
    super.onInit();
  }

  void save() {
    if (formKey.currentState!.validate()) {
      // Save the data
      String holderName = cardNameHolderController.text;
      String expiryDate = cardExpiryController.text;

      // Update the payment info
      paymentInfo[index!]['holderName'] = holderName;
      paymentInfo[index!]['expiryDate'] = expiryDate;
    }
  }

  setIndex(int index) {
    this.index = index;
  }
}
