import 'dart:developer';

import 'package:flowers_store/data/model/florist/florist_order_model.dart';
import 'package:flowers_store/data/source/remote/profile/profile_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:get/get.dart';

abstract class FlowristOrderController extends GetxController {
  Future<void> getFloristOrders();
  filterSearch({required String searchText});
  filterByStatus({required String status});
}

class FlowristOrderControllerImp extends FlowristOrderController {
  ProfileData profileData = ProfileData(Get.find());
  final List<FloristOrderModel?> floristOrderModelList = [];
  String filterstatus = '';
  String filtersearch = "";
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    getFloristOrders();
    super.onInit();
  }

  @override
  Future<void> getFloristOrders() async {
    statusRequest = StatusRequest.readLoading;
    update();
    log("search:$filtersearch");
    log("status:$filterstatus");
    try {
      var response = await profileData.getFloristListOrders(
          search: filtersearch, status: filterstatus);
      if (response["message"] == "success") {
        statusRequest = StatusRequest.success;
        for (var element in response["data"]) {
          floristOrderModelList.add(FloristOrderModel.fromJson(element));
        }
      } else {
        if (response["status"] == "offline") {
          statusRequest = StatusRequest.offlineFailure;
        } else {
          statusRequest = StatusRequest.failure;
        }
        Get.showSnackbar(
          GetSnackBar(
            message: response["message"].toString(),
            duration: const Duration(seconds: 5),
          ),
        );
      }
      update();
    } catch (error) {
      statusRequest = StatusRequest.exceptionFailure;
      Get.showSnackbar(
        GetSnackBar(
          message: error.toString(),
          duration: const Duration(seconds: 5),
        ),
      );
      update();
    }
  }

  @override
  filterSearch({required String searchText}) {
    filtersearch = searchText;
    log("Filtersearch:$filtersearch");
    floristOrderModelList.clear();
    getFloristOrders();
  }

  @override
  filterByStatus({required String status}) {
    if (status.toLowerCase() == "all") {
      filterstatus = "";
    } else {
      filterstatus = status.toLowerCase();
    }
    log("Filterstatus:$filterstatus");
    floristOrderModelList.clear();
    getFloristOrders();
  }
}
