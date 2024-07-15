import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CongratulationPage extends StatelessWidget {
  const CongratulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Congratu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'lations',
                      style: TextStyle(
                        color: Color(0xFFA739EA),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your order has been successfully ordered',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SvgPicture.asset(
                  Assets.illustration.checkoutCongrats,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButton(
                  onPressed: () {
                    Get.offAllNamed(kBottomNavigationScreen);
                  },
                  style: ButtonStyle(
                      fixedSize: WidgetStatePropertyAll(Size(Get.width, 48.0)),
                      backgroundColor:
                          const WidgetStatePropertyAll(KzlyColors.primary),
                      shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))))),
                  child: const Text(
                    "Explore Products",
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
      ),
    );
  }
}
