import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/assets.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/widgets/flowerist/filter/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterListtileRadio extends StatelessWidget {
  const FilterListtileRadio(
      {super.key,
      required this.title,
      required this.numGoldStar, required this.value,
      });

  final String title;
  final int numGoldStar;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            height: 14,
            child: Radio(
              value: 1,
              groupValue: 1,
              onChanged: (value) {},
              activeColor: KzlyColors.primary,
            ),
          ),
          Row(
            children: [
              ...List.generate(
                numGoldStar,
                (index) => const SvgIcon(svgIcon: IconAsset.goldstart),
              ),
              ...List.generate(
                5 - numGoldStar,
                (index) => SvgIcon(svgIcon: Assets.icons.star),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
