import 'package:flowers_store/controllers/cart/cart_controller.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/widgets/cart/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<CartControllerImp>(builder: (controller) {
          return controller.myCartList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.myCartList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: CartTile(
                            count: controller.quantities[index],
                            product: controller.myCartList[index].product!,
                            isCheck: controller.myCartList[index].isIncheckOut,
                            onTapCheck: (val) {
                              controller.onCheck(controller.myCartList[index], val!);
                            },
                            onPressedDelte: (value) {
                              controller
                                  .removeItemMyCart(controller.myCartList[index]);
                            },
                            onAdd: () {
                              controller.increaseMyCart(
                                  controller.myCartList[index], index);
                            },
                            onMinus: () {
                              controller.decreaseMyCart(
                                  controller.myCartList[index], index);
                            },
                          ),
                        ),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              RoundCheckBox(
                                onTap: (val) {
                                  controller.selectAll(val!);
                                },
                                uncheckedWidget: const Icon(
                                  Icons.check_rounded,
                                  size: 18,
                                ),
                                checkedWidget: const Icon(
                                  Icons.check_rounded,
                                  color: KzlyColors.white,
                                  size: 18,
                                ),
                                disabledColor: Colors.white,
                                checkedColor: const Color.fromRGBO(176, 77, 236, 1),
                                isChecked: controller.isSelectAll,
                                size: 26,
                                border:
                                    Border.all(width: 0, style: BorderStyle.none),
                                animationDuration: const Duration(milliseconds: 100),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                "ALL",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: KzlyColors.primary),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "EGP ${NumberFormat.currency(symbol: "").format(controller.totalPrice)}",
                                style: const TextStyle(
                                    color: KzlyColors.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 12),
                              FilledButton(
                                onPressed: () {
                                  Get.toNamed(kCheckoutPage, arguments: {
                                    'checkoutList': controller.checkoutList,
                                    'totlaPrice': controller.totalPrice,
                                  });
                                },
                                style: const ButtonStyle(
                                    visualDensity: VisualDensity.comfortable,
                                    backgroundColor:
                                        WidgetStatePropertyAll(KzlyColors.primary),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                                child: Text(
                                  "Checkout(${controller.totlaQuantity})",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: KzlyColors.primaryWhiteText,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : controller.statusRequest == StatusRequest.loading
                  ? const Center(child: CircularProgressIndicator())
                  : const Center(child: Text("No Product Found"));
        }));
  }
}
