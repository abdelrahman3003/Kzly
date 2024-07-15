import 'package:flowers_store/controllers/payment/payment_page_controller.dart';
import 'package:flowers_store/views/widgets/credit_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPaymentController extends GetxController {
  final formKey = GlobalKey<FormState>();
  int? index;
  TextEditingController cardNameHolderController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  save() {
    if (formKey.currentState!.validate()) {
      // Add new card to the payment info
      paymentInfo.add({
        'holderName': cardNameHolderController.text,
        'endingCardNumber': cardNumberController.text,
        'expiryDate': cardExpiryController.text,
        'cardType': CardType.visa,
        'isSelected': false,
      });
    }
    update();
  }
}
