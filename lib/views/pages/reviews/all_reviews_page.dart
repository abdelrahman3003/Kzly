import 'package:flowers_store/views/widgets/custom_appbar_flowrist.dart';
import 'package:flowers_store/views/widgets/review/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllReviewsPage extends StatelessWidget {
  const AllReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: const CustomAppbarFlowrist(title: "All Reviews"),
      ),
        body: SafeArea(
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 16.w,vertical:16.h),
            child: ListView.separated(
                itemBuilder: (context, index) =>const ReviewCard(width:double.infinity),
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemCount: 20),
          ),
        ));
  }
}
