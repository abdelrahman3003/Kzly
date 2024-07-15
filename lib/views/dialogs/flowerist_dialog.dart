import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/widgets/flowerist/row_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloweristDialog extends StatelessWidget {
  final VoidCallback onGo;
  final String name;
  const FloweristDialog({
    super.key,
    required this.onGo,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 18),
        decoration: BoxDecoration(
          color: KzlyColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: AspectRatio(
                  aspectRatio: 1, child: Image.asset(Assets.images.aproval2.path)),
            ),
            // Text(
            //   "You have scheduled an appointment with the florist Mazen Zekry. They will contact you soon.",
            //   style: TextStyle(
            //     fontSize: 16.sp,
            //     fontWeight: FontWeight.w500,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            RichText(
              textScaler: TextScaler.noScaling,
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "You have scheduled an appointment with the florist ",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        )),
                TextSpan(
                    text: name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: KzlyColors.primary)),
                TextSpan(
                    text: " They will contact you soon ",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        )
                    // TextStyle(
                    //     fontSize: 16.sp,
                    //     fontWeight: FontWeight.w500,
                    //     fontFamily: font,
                    //     color: KzlyColors.black),
                    ),
              ]),
            ),
            const SizedBox(height: 16),
            const DetailsRow(firstTilte: "Florist Name", lastTitle: "Zekry"),
            const DetailsRow(firstTilte: "Section", lastTitle: "Wedding"),
            const DetailsRow(firstTilte: "Date", lastTitle: "Sat, 14 July"),
            const DetailsRow(firstTilte: "Time", lastTitle: "5:00 PM ~ 8:00PM"),
            const DetailsRow(firstTilte: "Price", lastTitle: "450 EGP for 3 hours"),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onGo,
                style: const ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size.fromHeight(42.0)),
                    backgroundColor: WidgetStatePropertyAll(KzlyColors.primary),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))))),
                child: Text(
                  "Go to garden",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: KzlyColors.primaryWhiteText,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
