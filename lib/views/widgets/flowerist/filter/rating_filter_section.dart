import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/assets.dart';
import 'package:flowers_store/views/widgets/flowerist/filter/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingFilterSection extends StatelessWidget {
  const RatingFilterSection(
      {super.key, required this.title, required this.numGoldStar});
  final String title;
  final int numGoldStar;
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
