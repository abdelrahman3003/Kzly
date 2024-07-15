import 'package:flowers_store/controllers/payment/edit_payment_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/function/validation.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flowers_store/views/widgets/shared/content/text_fourm_field_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPaymentPage extends StatelessWidget {
  const EditPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Card'),
        centerTitle: true,
      ),
      body: GetBuilder<EditPaymentController>(
          init: EditPaymentController(),
          builder: (controller) {
            print("Controller Index: ${controller.index}");
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: Form(
                      key: controller.formKey,
                      child: ListView(
                        children: [
                          const SizedBox(height: 16),
                          TextFourmFieldContent(
                              text:
                                  Text("Card Holder Name", style: TextThemes.label),
                              textFormField: TextFormField(
                                controller: controller.cardNameHolderController,
                                decoration: const InputDecoration(
                                  hintText: "John Doe",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "PLease enter your Card Name";
                                  }
                                  return null;
                                },
                              )),
                          const SizedBox(height: 16),
                          TextFourmFieldContent(
                              text: Text("Expiary Date", style: TextThemes.label),
                              textFormField: TextFormField(
                                  controller: controller.cardExpiryController,
                                  decoration: const InputDecoration(
                                    hintText: "MM/YY",
                                  ),
                                  validator: (value) =>
                                      FormValidator.cardExpiry(value))),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFEFEFE),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x0F000000),
                          blurRadius: 16,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: FilledButton(
                      onPressed: () {
                        controller.save();
                        Get.back();
                      },
                      style: ButtonThemes.primary.copyWith(
                          fixedSize: WidgetStatePropertyAll(Size(Get.width, 48.0))),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 14,
                            color: KzlyColors.primaryWhiteText,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
