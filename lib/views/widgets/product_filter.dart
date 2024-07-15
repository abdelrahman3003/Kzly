import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductFilter extends StatelessWidget {
  const ProductFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Container(
          height: Get.height / 2,
          width: double.infinity,
          color: Colors.red,

        ),

      ],
      
    );
  }
}
