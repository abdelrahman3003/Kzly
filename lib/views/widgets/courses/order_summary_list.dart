import 'package:flowers_store/views/widgets/courses/order_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummaryList extends StatelessWidget {
  const OrderSummaryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const OrderSummaryCard(),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 12.h),
    );
  }
}
