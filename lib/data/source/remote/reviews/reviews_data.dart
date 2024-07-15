import 'package:flowers_store/data/model/reivews/review.dart';
import 'package:flowers_store/herlpers/class/crud.dart';
import 'package:flowers_store/herlpers/constant/backlinks.dart';

class ReviewsData {
  final Crud crud;
  ReviewsData(this.crud);

  getAllReviews(String id) async {
    var response = await crud.getData(url: allReviewsLink(id: id),);
    return response;
  }

  createReview(
    Review review,
  ) async {
    var response = await crud.postData(
        url: createReviewLink(id: review.product), data: review.toJson());
    return response;
  }
}
