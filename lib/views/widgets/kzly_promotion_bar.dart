import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class KzlyPromotionBar extends StatelessWidget {
  const KzlyPromotionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KzlyColors.secondry,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Discover ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Uniquly',
                          style: TextStyle(
                            color: Color(0xFFA739EA),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text \nof the printing and typesetting industry.",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: KzlyColors.black,
                      fontSize: 10,
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                    onPressed: () {},
                    style: ButtonThemes.primary.copyWith(
                        padding: const WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 32)),
                        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(0))),
                    child: const Text(
                      "Discover Now",
                      style: TextStyle(
                          fontSize: 12,
                          color: KzlyColors.primaryWhiteText,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Image.asset(
              Assets.images.fl7.path,
            ),
          ))
        ],
      ),
    );
  }
}
