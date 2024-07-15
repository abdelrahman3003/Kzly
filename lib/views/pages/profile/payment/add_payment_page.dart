import 'package:flowers_store/controllers/payment/add_payment_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/function/validation.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flowers_store/views/widgets/shared/content/text_fourm_field_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddPaymentPage extends StatelessWidget {
  const AddPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Card'),
        centerTitle: true,
      ),
      body: GetBuilder<AddPaymentController>(
          init: AddPaymentController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: Form(
                      key: controller.formKey,
                      child: ListView(
                        children: [
                          const SizedBox(height: 8),
                          FilledButton(
                            onPressed: () {
                              // Add your onPressed logic here
                            },
                            style: FilledButton.styleFrom(
                                fixedSize: Size(Get.width / 2, 62.0),
                                side: const BorderSide(
                                    width: 1, color: KzlyColors.black),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                backgroundColor: KzlyColors.white),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.camera,
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Scan your card',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  decoration:
                                      const BoxDecoration(color: Color(0xFFB8B4BA)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'OR',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFAF61E0),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  decoration:
                                      const BoxDecoration(color: Color(0xFFB8B4BA)),
                                ),
                              ),
                            ],
                          ),
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
                              text: Text("Card Number", style: TextThemes.label),
                              textFormField: TextFormField(
                                  controller: controller.cardNumberController,
                                  decoration: const InputDecoration(
                                    hintText: "1234 5678 9012 3456123",
                                  ),
                                  validator: (value) =>
                                      FormValidator.cardNumber(value))),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextFourmFieldContent(
                                    text: Text("Expiary Date",
                                        style: TextThemes.label),
                                    textFormField: TextFormField(
                                        controller: controller.cardExpiryController,
                                        decoration: const InputDecoration(
                                          hintText: "MM/YY",
                                        ),
                                        validator: (value) =>
                                            FormValidator.cardExpiry(value))),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: TextFourmFieldContent(
                                    text: Text("CVV", style: TextThemes.label),
                                    textFormField: TextFormField(
                                        controller: controller.cvvController,
                                        decoration: const InputDecoration(
                                          hintText: "123",
                                        ),
                                        validator: (value) =>
                                            FormValidator.cvv(value))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
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
                        "Save Card",
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
