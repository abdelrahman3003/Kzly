import 'package:flowers_store/data/model/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum StepEnabling { sequential, individual }

class CheckoutController extends GetxController {
  final GlobalKey<FormState> personalInfo = GlobalKey<FormState>();
  final GlobalKey<FormState> paymentInfoCard = GlobalKey<FormState>();
  final GlobalKey<FormState> paymentInfoCash = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmationInfo = GlobalKey<FormState>();
  final GlobalKey<FormState> addCard = GlobalKey<FormState>();
  TextEditingController location = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController buildingNumber = TextEditingController();
  TextEditingController apartmentNumber = TextEditingController();
  TextEditingController floorNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController promoCodeCard = TextEditingController();
  TextEditingController promoCodeCash = TextEditingController();
  TextEditingController driverNotes = TextEditingController();

  RxInt _index = 0.obs;
  RxInt activeStep = 0.obs;
  RxInt activeStep2 = 0.obs;
  RxInt reachedStep = 0.obs;
  RxInt selectedIndex = 0.obs;
  RxBool isAddingCard = false.obs;
  RxInt selectedPaymentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  final PageController paymentPageController = PageController(initialPage: 0);
  int? totlalPrice;
  // Define reachedSteps here
  Set<int> reachedSteps = <int>{0, 2, 4, 5};
  List<Cart> checkoutList = [];
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void switchAddingCard() {
    isAddingCard(!isAddingCard.value);
    update();
  }

  void increaseProgress() {
    if (_index.value < 4) {
      _index++;
      pageController.animateToPage(
        _index.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _index(0);
    }
  }

  int get index => _index.value;

  void decreaseProgress() {
    if (_index.value > 0) {
      _index--;
      pageController.animateToPage(
        _index.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _index(0);
    }
  }

  bool allowTabStepping(int index, StepEnabling enabling) {
    return enabling == StepEnabling.sequential
        ? index <= reachedStep.value
        : reachedSteps.contains(index);
  }

  void onPageChanged(int index) {
    _index(index);
    activeStep2(index); // Update activeStep2 when the page changes
  }

  void submitPersonlInfo({bool skip = false}) {
    isAddingCard(false);
    if (personalInfo.currentState!.validate() && !skip) {
      personalInfo.currentState!.save();
      increaseProgress();
    }
    if (skip) {
      increaseProgress();
    }
  }

  void submitPaymentInfoCard() {
    if (paymentInfoCard.currentState!.validate()) {
      paymentInfoCard.currentState!.save();
      increaseProgress();
    }
  }

  void submitPaymentInfoCash() {
    if (paymentInfoCash.currentState!.validate()) {
      paymentInfoCash.currentState!.save();
      increaseProgress();
    }
  }

  void submitAddCard({bool skip = false}) {
    if (addCard.currentState!.validate() && !skip) {
      addCard.currentState!.save();
      increaseProgress();
    }
    if (skip) {
      increaseProgress();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    checkoutList = Get.arguments['checkoutList'];
    totlalPrice=Get.arguments['totlaPrice'];
    super.onInit();
  }
}
