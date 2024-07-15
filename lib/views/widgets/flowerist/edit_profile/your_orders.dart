import 'package:flowers_store/controllers/flowrist/flowerist_order_controller.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/shared/enums/enum.dart';
import 'package:flowers_store/herlpers/shared/lotties/Offine_lottie.dart';
import 'package:flowers_store/views/widgets/flowerist/flowerist_order_list_items.dart';
import 'package:flowers_store/views/widgets/shared/kzly_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class YourOrders extends StatelessWidget {
  const YourOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FlowristOrderControllerImp());
    return GetBuilder<FlowristOrderControllerImp>(
        builder: (controller) => Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: KzlySearchBar(
                      onSubmit: (value) =>
                          controller.filterSearch(searchText: value),
                      options: KzlyOrdersSections2.values
                          .map((section) => section.toString().split('.').last)
                          .toList(),
                      onSortPressed: (value) =>
                          controller.filterByStatus(status: value)),
                ),
                const Divider(
                  height: 0,
                ),
                Expanded(
                    child: controller.statusRequest == StatusRequest.offlineFailure
                        ? const Offline()
                        : controller.statusRequest == StatusRequest.readLoading &&
                                controller.floristOrderModelList.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : controller.floristOrderModelList.isEmpty
                                ? Center(
                                    child: Text("No Data Found",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700,
                                            color: KzlyColors.purpleBlack)),
                                  )
                                : ListView.separated(
                                    itemCount:
                                        controller.floristOrderModelList.length,
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                      indent: 16,
                                      endIndent: 16,
                                      height: 0,
                                    ),
                                    itemBuilder: (context, index) =>
                                        FloweristOrderListItems(
                                      floristOrderModel:
                                          controller.floristOrderModelList[index],
                                    ),
                                  ))
              ],
            ));
  }
}
