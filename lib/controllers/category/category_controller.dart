import 'package:flowers_store/data/model/category/category.dart';
import 'package:flowers_store/data/source/remote/category/category_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final CategoryData _categoryData = CategoryData(Get.find());
  RxList<Category> categories = <Category>[].obs;
  RxBool isLoading = false.obs;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  fetchCategories() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await _categoryData.getCategires();
    List data = response["data"];
    if (response["status"] == "success") {
      statusRequest = StatusRequest.success;
      categories.addAll(data.map((e) => Category.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
