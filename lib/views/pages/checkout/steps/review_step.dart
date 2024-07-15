import 'package:chips_choice/chips_choice.dart';
import 'package:flowers_store/controllers/checkout/checkout_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/herlpers/shared/about_textformfiled.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReviewStep extends StatefulWidget {
  const ReviewStep({super.key});

  @override
  State<ReviewStep> createState() => _ReviewStepState();
}

class _ReviewStepState extends State<ReviewStep> {
  List<String> tags = [];
  List<String> options = [
    'Overall Service',
    'Overall Quality',
    'Overall Experience',
    'User Interface Design',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 16),
              const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Your Experience Matter For ',
                        style: TextStyle(
                          color: KzlyColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Us',
                        style: TextStyle(
                          color: KzlyColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SvgPicture.asset(Assets.illustration.checkoutExperiance),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: RatingBar(
                  itemSize: 30,
                  initialRating: 0,
                  glow: false,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  ratingWidget: RatingWidget(
                    full: SvgPicture.asset(
                      Assets.icons.starFilled,
                      colorFilter: const ColorFilter.mode(
                          KzlyColors.primary, BlendMode.srcIn),
                    ),
                    half: SvgPicture.asset(
                      Assets.icons.starFilled,
                      colorFilter: const ColorFilter.mode(
                          KzlyColors.primary, BlendMode.srcIn),
                    ),
                    empty: SvgPicture.asset(
                      Assets.icons.star,
                      colorFilter: const ColorFilter.mode(
                          KzlyColors.primary, BlendMode.srcIn),
                    ),
                  ),
                  unratedColor: KzlyColors.white,
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  ChipsChoice<String>.multiple(
                    value: tags,
                    onChanged: (val) => setState(() => tags = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: options,
                      value: (i, v) => v,
                      label: (i, v) => v,
                      tooltip: (i, v) => v,
                    ),
                    choiceStyle: C2ChipStyle.filled(
                      borderRadius: BorderRadius.circular(30),
                      selectedStyle: const C2ChipStyle(
                          backgroundColor: KzlyColors.primary,
                          foregroundStyle: TextStyle(color: KzlyColors.white)),
                      foregroundStyle: const TextStyle(color: KzlyColors.primary),
                      color: const Color.fromRGBO(247, 236, 253, 1),
                    ),
                    choiceCheckmark: false,
                    textDirection: TextDirection.ltr,
                    wrapped: true,
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: AboutTextformfiled(
                        hint: "Write your review here",
                      )),
                  const SizedBox(height: 16),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
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
          child: GetBuilder<CheckoutController>(builder: (controller) {
            return FilledButton(
              onPressed: () {
                Get.toNamed(kCongratulationPage);
                controller.checkoutList.clear();
              },
              style: ButtonThemes.primary
                  .copyWith(fixedSize: WidgetStatePropertyAll(Size(Get.width, 48))),
              child: const Text(
                "Order",
                style: TextStyle(
                    fontSize: 14,
                    color: KzlyColors.primaryWhiteText,
                    fontWeight: FontWeight.bold),
              ),
            );
          }),
        ),
      ],
    );
  }
}
