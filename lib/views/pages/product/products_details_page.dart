import 'package:flowers_store/controllers/reviews/reviews_controller.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/dialogs/review_dialog.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/cart/add_minus_button.dart';
import 'package:flowers_store/views/widgets/review/item_review_card.dart';
import 'package:flowers_store/views/widgets/review/rating_summary.dart';
import 'package:flowers_store/views/widgets/shared/item_description.dart';
import 'package:flowers_store/views/widgets/shimmer/KzlyShimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/product_details_controller.dart';
import '../../widgets/shared/item_card.dart';
import '../../widgets/shared/kazly_text.dart';
import '../../widgets/product_detail_appbar.dart';
import '../../widgets/rate_item.dart';

class ProdoctDetailsPage extends StatelessWidget {
  const ProdoctDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
      body: Column(
        children: [
          const ProductDetailsAppbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ItemCard(image: "assets/images/test1.jpg"),
                  const SizedBox(height: 10),
                  const ItemRate(price: "700", rate: 5, isInsack: true),
                  const SizedBox(height: 24),
                  const KzlyText(text: "Description", color: KzlyColors.primary),
                  const SizedBox(height: 8),
                  const ItemDesc(
                    des:
                        "Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLoremipsumLorem ipsumLorem ipsumLorem ipsumLoremipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLoremipsumLorem ipsumLorem ipsumLorem ipsumLorem",
                  ),
                  SizedBox(height: 24.h),
                  const KzlyText(text: "Related"),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: SingleChildScrollView(child: Text("data")
                        // StaggeredGrid.count(
                        //   crossAxisCount: 2,
                        //   mainAxisSpacing: 14,
                        //   crossAxisSpacing: 14,
                        //   children: [
                        //   ],
                        // ),
                        ),
                  ),
                  SizedBox(height: 24.h),
                  const KzlyText(text: "Reviews"),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RatingSummary(
                        averageRating: 4.5,
                        onTapWriteReview: () => Get.dialog(ReviewDialog(
                              onsubmit: () {},
                              cancel: () => Get.back(),
                            )),
                        numberOfReviews: 260,
                        ratings: [0.6, 0.4, .9, .3, .1]),
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  GetBuilder<ReviewsControllerImp>(
                    init: ReviewsControllerImp(),
                    builder: (controller) {
                      if (controller.statusRequest == StatusRequest.success) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.reviews.data.length,
                          separatorBuilder: (context, index) => const Divider(
                            indent: 16,
                            endIndent: 16,
                          ),
                          itemBuilder: (context, index) {
                            final review = controller.reviews.data[index];
                            return ReviewListTile(
                              review: review,
                            );
                          },
                        );
                      }
                      if (controller.statusRequest == StatusRequest.loading) {
                        return ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                            5,
                            (index) => KzlyShimmer.reviewTile(),
                          ),
                        );
                      }
                      if (controller.statusRequest == StatusRequest.none) {
                        return const Center(child: Text("No Reviews"));
                      }
                      return const SizedBox(height: 0);
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const AddMinusButton(),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  style: ButtonThemes.primary.copyWith(
                      fixedSize: WidgetStatePropertyAll(Size(Get.width, 48))),
                  child: const Text("Add to Cart"),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 18.h)
        ],
      ),
    );
  }
}
