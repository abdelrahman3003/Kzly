import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


@Deprecated("Use Solar Icons Pacakge instead")
class AssetIcon extends StatelessWidget {
  final String assetPath;

  const AssetIcon(
      {super.key,
      required this.assetPath,
      this.color,
      this.size,
      this.padding});
  final Color? color;
  final Size? size;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? const EdgeInsets.only(left: 12, right: 16),
        child: SvgPicture.asset(
          assetPath,
          height: 16,
          width: 16,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.dstIn) : null,
        ));
  }
}
