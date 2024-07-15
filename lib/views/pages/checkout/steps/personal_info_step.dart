import 'package:flowers_store/controllers/checkout/checkout_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/function/validation.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flowers_store/views/widgets/shared/content/text_fourm_field_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key, required this.onTapNext});
  final Function()? onTapNext;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Form(
          key: controller.personalInfo,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    TextFourmFieldContent(
                      text: Text("Location", style: TextThemes.label),
                      textFormField: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Jeddah, Saudi Arabia",
                          suffixIcon: Icon(Icons.location_on),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your location";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFourmFieldContent(
                      text: Text("Street Name", style: TextThemes.label),
                      textFormField: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Damascus Street",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your street name";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFourmFieldContent(
                      text: Text("Building Number", style: TextThemes.label),
                      textFormField: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Damascus Street",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your building number";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                            child: TextFourmFieldContent(
                          text:
                              Text("Apartment Number", style: TextThemes.label),
                          textFormField: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "1",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your apartment number";
                              }
                              return null;
                            },
                          ),
                        )),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: TextFourmFieldContent(
                              text:
                                  Text("Floor Number", style: TextThemes.label),
                              textFormField: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "1",
                                ),
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your floor number";
                                  }
                                  return null;
                                }),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFourmFieldContent(
                      text: Text("Phone Number", style: TextThemes.label),
                      textFormField: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "+966 123 456 789",
                          ),
                          validator: (value) => FormValidator.phone(value)),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16.0),
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
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          controller.submitPersonlInfo();
                        },
                        onLongPress: () {
                          FocusScope.of(context).unfocus();
                          controller.submitPersonlInfo(skip: true);
                        },
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
          ),
        ),
      );
    });
  }
}
