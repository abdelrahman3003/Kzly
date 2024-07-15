import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class KzlyShimmer {
  static Widget reviewTile() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 50,
            height: 50,
            color: Colors.white,
          ),
        ),
        title: Container(
          width: double.infinity,
          height: 18,
          color: Colors.white,
        ),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 14,
              color: Colors.white,
            ),
            SizedBox(height: 4),
            Container(
              width: double.infinity,
              height: 12,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  static Widget profileListTile() => Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.r,
          backgroundColor: Colors.white,
        ),
        title: Container(
          width: double.infinity,
          height: 18,
          color: Colors.white,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ));
}
