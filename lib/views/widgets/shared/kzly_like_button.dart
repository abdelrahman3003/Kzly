import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:solar_icons/solar_icons.dart';

class KzlyLikeButton extends StatelessWidget {
  const KzlyLikeButton({super.key, this.isLiked, this.onTap});
  final bool? isLiked;
  final Future<bool?> Function(bool)? onTap;
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      isLiked: isLiked,
      size: 24,
      bubblesColor: const BubblesColor(
          dotPrimaryColor: KzlyColors.primary, dotSecondaryColor: KzlyColors.secondry),
      likeBuilder: ( isLiked) {
        return isLiked
            ? const Icon(
                SolarIconsBold.heart,
                color: KzlyColors.primary,
              )
            : const Icon(
                SolarIconsOutline.heart,
                color: KzlyColors.primary,
              );

      },
      onTap: onTap,
    );
  }
}
