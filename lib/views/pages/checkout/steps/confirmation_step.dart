import 'package:flowers_store/controllers/checkout/checkout_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/pages/checkout/steps/payment_views/cartile_checkout.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flowers_store/views/widgets/shared/asset_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ConfirmationStep extends StatefulWidget {
  const ConfirmationStep({super.key, this.onTapNext});
  final Function()? onTapNext;

  @override
  _ConfirmationStepState createState() => _ConfirmationStepState();
}

class _ConfirmationStepState extends State<ConfirmationStep> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (conntroller) {
      return Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: ListView(
                children: [
                  const SizedBox(height: 4),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Order Items', style: TextThemes.label)),
                  const SizedBox(height: 8),
                  ListView.builder(
                    itemCount: conntroller.checkoutList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CartTileCheckout(
                        product: conntroller.checkoutList[index].product!,
                        enableDeleteButton: false,
                        hideCheckBox: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Summary', style: TextThemes.label)),
                  const SizedBox(height: 10),
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    tileColor: KzlyColors.black.withOpacity(.05),
                    leading: SvgPicture.asset(Assets.icons.gps),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    contentPadding: const EdgeInsets.fromLTRB(18, 0, 8, 4),
                    title: const Text(
                      'Area',
                      style: TextStyle(
                        color: Color(0xFF67606C),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      'Kanat Elswies Street, Saudi Arabia',
                      style: TextStyle(
                        color: Color(0xFFA739EA),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: TextButton(
                      style: const ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                      onPressed: () {},
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          color: Color(0xFF3D0A5C),
                          fontSize: 12,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  ListTile(
                      visualDensity: VisualDensity.compact,
                      tileColor: KzlyColors.black.withOpacity(.05),
                      leading: SvgPicture.asset(Assets.icons.truckFast),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding: const EdgeInsets.fromLTRB(18, 4, 8, 4),
                      title: const Text(
                        'Your delivery will be ready on 30 mins',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  const SizedBox(height: 14),
                  ListTile(
                      visualDensity: VisualDensity.compact,
                      tileColor: KzlyColors.black.withOpacity(.05),
                      leading: AssetIcon(
                        assetPath: Assets.icons.paymentCard,
                        color: KzlyColors.primary,
                        size: const Size(18, 18),
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding: const EdgeInsets.fromLTRB(18, 4, 8, 4),
                      title: const Text(
                        'XXXX-XXXX-XXXX-XXXX',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  const SizedBox(height: 8),
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
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: TextThemes.subtitle.copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        conntroller.totlalPrice.toString(),
                        style: TextThemes.price,
                      ),
                    ],
                  ),
                  const SizedBox(width: 52),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        widget.onTapNext!();
                      },
                      style: ButtonThemes.primary.copyWith(
                          fixedSize: WidgetStatePropertyAll(Size(Get.width, 48))),
                      child: const Text(
                        "Confirm Order",
                        style: TextStyle(
                            fontSize: 14,
                            color: KzlyColors.primaryWhiteText,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      );
    });
  }
}
