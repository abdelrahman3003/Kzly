import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

enum CardType {
  visa,
  mastercard,
  unknown,
}

class CreditCardTile extends StatelessWidget {
  const CreditCardTile({
    super.key,
    required this.holderName,
    required this.endingNumber,
    required this.expiryDate,
    required this.cardType,
    required this.isSelected,
    this.onSelectMenu,
    this.onChangeSelection,
  });

  final String holderName;
  final String endingNumber;
  final String expiryDate;
  final CardType? cardType;
  final Function(String)? onSelectMenu;
  final bool isSelected;
  final Function(bool?)? onChangeSelection;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          onChangeSelection != null ? onChangeSelection!(true) : null;
        },
        child: Card(
          elevation: 0,
          color: isSelected ? KzlyColors.secondry : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isSelected ? KzlyColors.primary : Colors.grey,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(
                    cardType == CardType.visa
                        ? Assets.icons.payment.visa
                        : cardType == CardType.mastercard
                            ? Assets.icons.payment.mastercard
                            : Assets.icons.paymentCard,
                    width: 26,
                    height: 26,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Card Ending in ${endingNumber.substring(endingNumber.length - 4)}"),
                          PopupMenuButton<String>(
                            initialValue: "Edit",
                            onSelected: onSelectMenu,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: KzlyColors.backgroundColor,
                            surfaceTintColor: KzlyColors.backgroundColor,
                            splashRadius: 0,
                            itemBuilder: (BuildContext context) {
                              return ["Edit", "Delete"].map((String option) {
                                return PopupMenuItem<String>(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList();
                            },
                            child: const Icon(
                              SolarIconsBold.menuDots,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Expiry\n${DateFormat('MMM, yyyy').format(DateFormat('MM/yy').parse(expiryDate))}",
                          ),
                          Row(
                            children: [
                              isSelected
                                  ? const Text(
                                      'Default',
                                      style: TextStyle(
                                        color: Color(0xFF96919A),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : const SizedBox(width: 0),
                              isSelected
                                  ? const SizedBox(width: 8)
                                  : const SizedBox(width: 0),
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Radio<bool>(
                                    value: isSelected,
                                    groupValue: true,
                                    onChanged: onChangeSelection),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
