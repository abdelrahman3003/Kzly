import 'package:flowers_store/controllers/my_order/my_order_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/shared/enums/enum.dart';
import 'package:flowers_store/views/themes/text_themes.dart';
import 'package:flowers_store/views/widgets/my_orders_card/my_orders_cards.dart';
import 'package:flowers_store/views/widgets/shared/kzly_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});
  @override
  Widget build(BuildContext context) {
    var orderController = Get.put(MyOrderController());
    return DefaultTabController(
      initialIndex: 0,
      length: KzlyOrdersSections.values.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: KzlyColors.purpleBlack,
              size: 24,
            ),
          ),
          title: Text('My Orders',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: KzlyColors.purpleBlack)),
          centerTitle: true,
          bottom: TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              onTap: (value) => orderController.selectedSection(value),
              labelColor: KzlyColors.primary,
              labelStyle: TextThemes.label,
              indicatorColor: KzlyColors.primary,
              tabs: List.generate(
                KzlyOrdersSections.values.length,
                (index) => GetBuilder<MyOrderController>(
                  builder: (controller) => Tab(
                      text: KzlyOrdersSections.values[index].name ==
                              KzlyOrdersSections.all.name
                          ? "${KzlyOrdersSections.values[index].name.capitalizeFirst}\t${controller.displayOrders.length}"
                          : KzlyOrdersSections.values[index].name ==
                                  KzlyOrdersSections.done.name
                              ? "${KzlyOrdersSections.values[index].name.capitalizeFirst}\t${controller.displayDoneOrders.length}"
                              : KzlyOrdersSections.values[index].name ==
                                      KzlyOrdersSections.pending.name
                                  ? "${KzlyOrdersSections.values[index].name.capitalizeFirst}\t${controller.dispalayPendingOrders.length}"
                                  : "${KzlyOrdersSections.values[index].name.capitalizeFirst}\t${controller.dispalayDeclineOrders.length}"),
                ),
              )),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              child: KzlySearchBar(
                onSubmit: (value) => orderController.searchingList(value),
                borderRadius: 25,
                onFilterPressed: () {},
              ),
            ),
            GetBuilder<MyOrderController>(builder: (controller) {
              return Expanded(
                child: TabBarView(
                    children: List.generate(
                  KzlyOrdersSections.values.length,
                  (s) => controller.tabindex == KzlyOrdersSections.all.index
                      ? controller.displayOrders.isEmpty
                          ? Center(
                              child: Text("No Data Found",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: KzlyColors.purpleBlack)))
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 8.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,vertical: 16.h),
                              itemCount: controller.displayOrders.length,
                              itemBuilder: (context, index) => MyOrdersCards(
                                  productdata: controller.displayOrders[index]))
                      : controller.tabindex == KzlyOrdersSections.done.index
                          ? controller.displayDoneOrders.isEmpty
                              ? Center(
                                  child: Text("No Data Found",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          color: KzlyColors.purpleBlack)))
                              : ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 8.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,vertical: 16.h),
                                  itemCount: controller.displayDoneOrders.length,
                                  itemBuilder: (context, index) => MyOrdersCards(
                                      productdata:
                                          controller.displayDoneOrders[index]))
                          : controller.tabindex == KzlyOrdersSections.pending.index
                              ? controller.dispalayPendingOrders.isEmpty
                                  ? Center(
                                      child: Text("No Data Found",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700,
                                              color: KzlyColors.purpleBlack)))
                                  : ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 8.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,vertical: 16.h),
                                      itemCount:
                                          controller.dispalayPendingOrders.length,
                                      itemBuilder: (context, index) => MyOrdersCards(
                                          productdata: controller
                                              .dispalayPendingOrders[index]))
                              : controller.dispalayDeclineOrders.isEmpty
                                  ? Center(
                                      child: Text("No Data Found",
                                          style:
                                              TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: KzlyColors.purpleBlack)))
                                  : ListView.separated(separatorBuilder: (context, index) => SizedBox(height: 8.h), padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h), itemCount: controller.dispalayDeclineOrders.length, itemBuilder: (context, index) => MyOrdersCards(productdata: controller.dispalayDeclineOrders[index])),
                )),
              );
            }),
          ],
        ),
      ),
    );
  }
}
