import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controllers/product_details_controller.dart';

class AddMinusButton extends StatelessWidget {
  const AddMinusButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
      builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  controller.delete();
                },
                child: SvgPicture.asset(Assets.icons.remove,
                    width: 24.w, height: 24.h)),
            Text("    ${controller.count}    ",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            GestureDetector(
                onTap: () {
                  controller.add();
                },
                child: SvgPicture.asset(Assets.icons.add,
                    width: 24.w, height: 24.h)),
          ],
        ),
      ),
    );
  }
}
