import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/widgets/shared/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountContainerWidget extends StatelessWidget {
  const DiscountContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16.w)),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/discount_image.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(139, 65, 185, 0.678),
                        Color.fromRGBO(43, 36, 36, 0.039),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.h, horizontal: 10.0.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Discount 30%",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: KzlyColors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp)),
                              Text("get offer when you buy your first course",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: KzlyColors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp)),
                            ],
                          ),
                        ),
                        AppTextButton(
                          buttonWidth: 90,
                          buttonHeight: 50,
                          buttonText: 'Discover',
                          textStyle: TextStyle(
                              color: KzlyColors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp),
                          onPressed: () {},
                          borderRadius: 20.h,
                        )
                      ]),
                ),
              ),
            ],
          )),
    );
  }
}
