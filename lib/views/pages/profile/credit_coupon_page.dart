import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCouponPage extends StatelessWidget {
  const CreditCouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Credit Coupon Page'),
          centerTitle: true,
          bottom: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            labelColor: KzlyColors.primary,
            labelStyle: TextThemes.label,
            indicatorColor: KzlyColors.primary,
            tabs: const <Widget>[
              Tab(
                text: 'Valid',
              ),
              Tab(
                text: 'No Valid',
              ),
              Tab(
                text: 'Expired',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(
              3,
              (index) => ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
                  itemBuilder: (context, index) => Padding(
                    padding:  EdgeInsets.symmetric(vertical: 24.h),
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              "Coupon Name",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: KzlyColors.black),
                            )),
                            Text(
                              "#15215244255",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: KzlyColors.primary,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                  ),
                  separatorBuilder: (context, index) =>Divider(
                        color: KzlyColors.primary.withOpacity(0.5),
                        thickness: 2,
                      ),
                  itemCount: 20)).toList(),
        ),
      ),
    );
  }
}
