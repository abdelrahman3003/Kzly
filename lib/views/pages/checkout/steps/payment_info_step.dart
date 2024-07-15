import 'package:flowers_store/controllers/checkout/checkout_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/function/validation.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flowers_store/views/widgets/shared/content/content_price.dart';
import 'package:flowers_store/views/widgets/shared/content/content_price_list.dart';
import 'package:flowers_store/views/widgets/shared/content/kzly_content.dart';
import 'package:flowers_store/views/widgets/shared/content/text_fourm_field_content.dart';
import 'package:flowers_store/views/widgets/shared/kzly_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentInfoStepPage extends GetView<CheckoutController> {
  const PaymentInfoStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GetBuilder<CheckoutController>(builder: (context) {
        return Column(
          children: [
            Obx(
              () => !controller.isAddingCard.value
                  ? Container(
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
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTabButton(
                              'Credit Card', 0, Assets.icons.paymentCard),
                          _buildTabButton('Cash', 1, Assets.icons.paymentCash),
                        ],
                      ),
                    )
                  : const SizedBox(height: 0),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.paymentPageController,
                onPageChanged: (index) {
                  controller.selectedPaymentIndex.value = index;
                },
                children: [
                  _buildPaymentMethod(0),
                  _buildPaymentMethod(1),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildPaymentMethod(int index) {
    switch (index) {
      case 0:
        return _cardPayment();
      case 1:
        return Column(
          children: [
            Flexible(
              child: ListView(
                children: [
                  TextFormField(
                    style: const TextStyle(
                      color: Color(0x99675F6C),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: "Any additional notes for the driver?",
                      hintStyle: const TextStyle(
                        color: Color(0x99675F6C),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Color(0xFF96919A)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    minLines:
                        6, // any number you need (It works as the rows for the textarea)
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                  const SizedBox(height: 16),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Payment Summary',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  const SizedBox(height: 8),
                  const ContentPriceList(
                    content: [
                      {"Subtotal": "EGP 100.00"},
                      {"Total": "EGP 100.00"}
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Promo Code',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Expanded(
                          child: KzlyTextField(
                        label: "",
                        hintText: "#1234",
                        hideLabel: true,
                      )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const ContentPrice(
                    title: "Total Price",
                    value: "EGP 1289",
                    isMain: true,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16),
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
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () => controller.decreaseProgress(),
                      style: ButtonThemes.secondary,
                      child: const Text(
                        "Back",
                        style: TextStyle(
                            fontSize: 14,
                            color: KzlyColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => controller.increaseProgress(),
                      style: ButtonThemes.primary,
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            fontSize: 14,
                            color: KzlyColors.primaryWhiteText,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _cardPayment() {
    return !controller.isAddingCard.value
        ? Column(
            children: [
              Flexible(
                child: ListView(
                  children: [
                    KzlyContent(
                        title: "Saved Cards",
                        trailing: TextButton(
                          onPressed: () {
                            controller.switchAddingCard();
                          },
                          child: const Text(
                            " + Add Card",
                            style: TextStyle(color: KzlyColors.primary),
                          ),
                        )),
                    AspectRatio(
                      aspectRatio: 1.586,
                      child: Container(
                        decoration: BoxDecoration(
                          color: KzlyColors.black.withOpacity(.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/hsbc.svg",
                                  height: 18,
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "**** 1234",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: KzlyColors.white),
                                ),
                                Text(
                                  "Debit",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: KzlyColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Payment Summary',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    const SizedBox(height: 8),
                    const ContentPriceList(
                      content: [
                        {"Subtotal": "EGP 100.00"},
                        {"Total": "EGP 100.00"}
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFourmFieldContent(
                      text: Text(
                        "Promo Code",
                        style: TextThemes.label,
                      ),
                      textFormField: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "#1234",
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const ContentPrice(
                      title: "Total Price",
                      value: "EGP 1289",
                      isMain: true,
                    ),
                    const SizedBox(height: 32),
                  ],
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
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () => controller.decreaseProgress(),
                        style: ButtonThemes.secondary,
                        child: const Text(
                          "Back",
                          style: TextStyle(
                              fontSize: 14,
                              color: KzlyColors.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: FilledButton(
                        onPressed: () => controller.increaseProgress(),
                        style: ButtonThemes.primary,
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 14,
                              color: KzlyColors.primaryWhiteText,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            children: [
              Expanded(
                child: Form(
                  key: controller.addCard,
                  child: ListView(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Payment Method',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      const SizedBox(height: 8),
                      FilledButton(
                        onPressed: () {
                          // Add your onPressed logic here
                        },
                        style: FilledButton.styleFrom(
                            fixedSize: Size(Get.width / 2, 62.0),
                            side:
                                const BorderSide(width: 1, color: KzlyColors.black),
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
                      TextFourmFieldContent(
                          text: Text("Card Holder Name", style: TextThemes.label),
                          textFormField: TextFormField(
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
                              decoration: const InputDecoration(
                                hintText: "John Doe",
                              ),
                              validator: (value) =>
                                  FormValidator.cardNumber(value))),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFourmFieldContent(
                                text: Text("Expiary Date", style: TextThemes.label),
                                textFormField: TextFormField(
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
                                    decoration: const InputDecoration(
                                      hintText: "123",
                                    ),
                                    validator: (value) => FormValidator.cvv(value))),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Payment Summary',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      const SizedBox(height: 8),
                      const ContentPriceList(
                        content: [
                          {"Subtotal": "EGP 100.00"},
                          {"Total": "EGP 100.00"}
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextFourmFieldContent(
                        text: Text(
                          "Promo Code",
                          style: TextThemes.label,
                        ),
                        textFormField: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "#1234",
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const ContentPrice(
                        title: "Total Price",
                        value: "EGP 1289",
                        isMain: true,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
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
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () => controller.decreaseProgress(),
                        style: ButtonThemes.secondary,
                        child: const Text(
                          "Back",
                          style: TextStyle(
                              fontSize: 14,
                              color: KzlyColors.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          controller.submitAddCard();
                        },
                        onLongPress: () {
                          controller.submitAddCard(skip: true);
                        },
                        style: ButtonThemes.secondary,
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 14,
                              color: KzlyColors.primaryWhiteText,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  Widget _buildTabButton(String text, int index, String assetPath) {
    return FilledButton(
      onPressed: () {
        controller.selectedPaymentIndex.value = index;
        controller.paymentPageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          Size(Get.width / 2 - 32, 80.0),
        ),
        backgroundColor: controller.selectedPaymentIndex.value == index
            ? WidgetStateProperty.all(KzlyColors.primary)
            : WidgetStateProperty.all(KzlyColors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: controller.selectedPaymentIndex.value == index
                ? BorderSide.none
                : const BorderSide(color: KzlyColors.primary, width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetPath,
            colorFilter: ColorFilter.mode(
              controller.selectedPaymentIndex.value == index
                  ? KzlyColors.white
                  : KzlyColors.primary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: controller.selectedPaymentIndex.value == index
                  ? KzlyColors.primaryWhiteText
                  : KzlyColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
