import 'package:flowers_store/controllers/payment/payment_page_controller.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/dialogs/basic_dialog.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/credit_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
        init: PaymentController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Payment'),
                centerTitle: true,
              ),
              body: controller.payments.isEmpty
                  ? const Center(
                      child: Text('No payment information available.'),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: controller.payments.length,
                      itemBuilder: (context, index) {
                        return CreditCardTile(
                          holderName: controller.payments[index]['holderName'],
                          endingNumber: controller.payments[index]
                              ['endingCardNumber'],
                          expiryDate: controller.payments[index]['expiryDate'],
                          cardType: controller.payments[index]['cardType'],
                          isSelected: controller.payments[index]['isSelected'],
                          onSelectMenu: (value) {
                            if (value == 'Edit') {
                              Get.toNamed(kEditPaymentPage, arguments: {
                                "index": index,
                              })?.then((_) => controller.update());
                            } else {
                              Get.dialog(
                                BasicDialog(
                                  title: 'Delete Card',
                                  subtitle:
                                      'Are you sure you want to delete this card?',
                                  onYes: () {
                                    controller.deleteCard(index);
                                    Get.back();
                                  },
                                  onNo: () => Get.back(),
                                ),
                              );
                            }
                          },
                          onChangeSelection: (value) {
                            controller.changeSelectedCard(index);
                          },
                        );
                      },
                    ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButton(
                  style: ButtonThemes.primary,
                  onPressed: () {
                    Get.toNamed(kAddPaymentPage)?.then((_) => controller.update());
                  },
                  child: const Text('Add'),
                ),
              ));
        });
  }
}
