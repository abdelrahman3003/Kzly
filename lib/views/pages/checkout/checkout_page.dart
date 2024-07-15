import 'package:flowers_store/controllers/checkout/checkout_controller.dart';
import 'package:flowers_store/views/dialogs/basic_dialog.dart';
import 'package:flowers_store/views/pages/checkout/steps/confirmation_step.dart';
import 'package:flowers_store/views/pages/checkout/steps/payment_info_step.dart';
import 'package:flowers_store/views/pages/checkout/steps/personal_info_step.dart';
import 'package:flowers_store/views/pages/checkout/steps/review_step.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatelessWidget {
  final controller = Get.put(CheckoutController());

  CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (popInvoked) {
          debugPrint("Pop Invoked: $popInvoked");
          !popInvoked
              ? Get.dialog(BasicDialog(
              
                  title: "Cancel Checkout",
                  subtitle:
                      "Canceling Checkout will not save your enterd information",
                  onNo: () {
                    Get.back();
                  },
                  onYes: () {
                    Get.back();
                    Get.back();
                  }))
              : null;
        },
        child: Column(
          children: [
            Obx(
              () => Container(
                  decoration: controller.index != 1
                      ? const BoxDecoration(
                          color: Color(0xFFFEFEFE),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x0F000000),
                              blurRadius: 16,
                              offset: Offset(0, 3),
                              spreadRadius: 0,
                            )
                          ],
                        )
                      : null,
                  height: 60,
                  child: EasyStepper(
                    alignment: Alignment.topCenter,
                    activeStep: controller.activeStep2.value,
                    maxReachedStep: controller.reachedStep.value,
                    enableStepTapping: false,
                    lineStyle: LineStyle(
                      lineLength: 60,
                      lineWidth: 0,
                      lineSpace: 0,
                      lineThickness: 2,
                      progressColor: Colors.grey.withOpacity(0.5),
                      progress: 1,
                      lineType: LineType.normal,
                      unreachedLineColor: Colors.grey.withOpacity(0.5),
                      finishedLineColor: KzlyColors.primary,
                      activeLineColor: Colors.grey.withOpacity(0.5),
                    ),
                    finishedStepBackgroundColor: KzlyColors.primary,
                    stepRadius: 10,
                    stepBorderRadius: 0,
                    showLoadingAnimation: false,
                    borderThickness: 1,
                    padding: const EdgeInsets.all(0),
                    activeStepIconColor: KzlyColors.white,
                    activeStepBackgroundColor: KzlyColors.primary,
                    activeStepBorderType: BorderType.normal,
                    activeStepBorderColor: KzlyColors.primary,
                    finishedStepBorderColor: KzlyColors.primary,
                    finishedStepBorderType: BorderType.normal,
                    finishedStepIconColor: KzlyColors.white,
                    unreachedStepBorderColor: KzlyColors.black,
                    unreachedStepBackgroundColor: KzlyColors.white,
                    unreachedStepBorderType: BorderType.normal,
                    steps: [
                      EasyStep(
                        icon: const Icon(
                          Icons.check,
                          size: 24,
                        ),
                        finishIcon: const Icon(
                          Icons.check,
                        ),
                        activeIcon: const Icon(
                          Icons.check,
                        ),
                        customTitle: const Text(
                          'Personal Info',
                          style: TextStyle(
                            height: 0,
                            fontSize: 12,
                            color: KzlyColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        enabled: controller.allowTabStepping(
                            0, StepEnabling.sequential),
                      ),
                      EasyStep(
                        icon: const Icon(
                          Icons.check,
                          size: 24,
                        ),
                        finishIcon: const Icon(
                          Icons.check,
                        ),
                        activeIcon: const Icon(
                          Icons.check,
                        ),
                        customTitle: const Text(
                          'Payment',
                          style: TextStyle(
                            height: 0,
                            fontSize: 12,
                            color: KzlyColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        enabled: controller.allowTabStepping(
                            0, StepEnabling.sequential),
                      ),
                      EasyStep(
                        icon: const Icon(
                          Icons.check,
                          size: 24,
                        ),
                        finishIcon: const Icon(
                          Icons.check,
                        ),
                        activeIcon: const Icon(
                          Icons.check,
                        ),
                        customTitle: const Text(
                          'Confirmation',
                          style: TextStyle(
                            height: 0,
                            fontSize: 12,
                            color: KzlyColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        enabled: controller.allowTabStepping(
                            0, StepEnabling.sequential),
                      ),
                      EasyStep(
                        icon: const Icon(
                          Icons.check,
                          size: 24,
                        ),
                        finishIcon: const Icon(
                          Icons.check,
                        ),
                        activeIcon: const Icon(
                          Icons.check,
                        ),
                        customTitle: const Text(
                          'Review',
                          style: TextStyle(
                            fontSize: 12,
                            color: KzlyColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        enabled: controller.allowTabStepping(
                            0, StepEnabling.sequential),
                      ),
                    ],
                    onStepReached: (index) => controller.activeStep2(index),
                  )),
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: controller.onPageChanged,
                children: [
                  PersonalInfoPage(
                    onTapNext: controller.increaseProgress,
                  ),
                  PaymentInfoStepPage(),
                  ConfirmationStep(
                    onTapNext: controller.increaseProgress,
                  ),
                  const ReviewStep(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
