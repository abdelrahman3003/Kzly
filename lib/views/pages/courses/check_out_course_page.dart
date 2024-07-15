import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/widgets/courses/order_summary_list.dart';
import 'package:flowers_store/views/widgets/courses/payment_method_widget.dart';
import 'package:flowers_store/views/widgets/courses/total_price_widget.dart';
import 'package:flowers_store/views/widgets/shared/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutCoursePage extends StatelessWidget {
  const CheckOutCoursePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Summary',
                  style: TextStyle(
                    color: KzlyColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  )),
              SizedBox(
                height: 16.h,
              ),
              const OrderSummaryList(),
              SizedBox(
                height: 40.h,
              ),
              const TotalPriceWidget(),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Payment Method",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: KzlyColors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 16.h,
              ),
              const PaymentMethodWidget(),
              SizedBox(
                height: 80.h,
              ),
              AppTextButton(
                buttonText: 'Confirm Order',
                backgroundColor: KzlyColors.primary,
                textStyle: TextStyle(
                    color: KzlyColors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
                onPressed: () {},
              ),
              SizedBox(
                height: 16.h,
              ),
              AppTextButton(
                buttonText: 'Edit Order',
                backgroundColor: KzlyColors.white,
                textStyle: TextStyle(
                    color: KzlyColors.primary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
                onPressed: () {},
              ),
              SizedBox(
                height: 71.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
