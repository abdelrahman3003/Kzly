import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
  });
  final String title;
  final String imagePath;

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: imagePath,
                placeholder: (context, url) => const AspectRatio(
                  aspectRatio: 1,
                  child: Icon(Icons.image),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(SolarIconsOutline.closeCircle),
              ),
              Positioned.fill(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                      alignment: Alignment.center,
                      color: Colors.black.withOpacity(0.4),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
