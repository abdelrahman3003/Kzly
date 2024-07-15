import 'package:flowers_store/data/model/reivews/review.dart';
import 'package:flowers_store/data/model/reivews/reviews.dart';
import 'package:flowers_store/data/source/remote/reviews/reviews_data.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:get/get.dart';

abstract class ReviewsController extends GetxController {
  addReview(Review review);
  getallReviews({required productId});
}

class ReviewsControllerImp extends ReviewsController {
  ReviewsData reviewsData = ReviewsData(Get.find());
  AppServices appServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Reviews reviews = Reviews(message: "message", data: []);
  @override
  void onInit() {
    String productId = Get.arguments;
    getallReviews(productId: productId);
    super.onInit();
  }

  @override
  addReview(Review review) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await reviewsData.createReview(review);
    if (response["status"] == "success") {
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  getallReviews({required productId}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await reviewsData.getAllReviews(productId);
    if (response["status"] == "success") {
      statusRequest = StatusRequest.success;
      reviews = Reviews.fromJson(response);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
