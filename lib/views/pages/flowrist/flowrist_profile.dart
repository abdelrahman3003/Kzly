import 'package:flowers_store/controllers/flowrist/flowrist_profile_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/dialogs/flowerist_dialog.dart';
import 'package:flowers_store/views/dialogs/review_dialog.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flowers_store/views/widgets/custom_appbar_flowrist.dart';
import 'package:flowers_store/views/widgets/review/rating_summary.dart';
import 'package:flowers_store/views/widgets/shared/asset_icon.dart';
import 'package:flowers_store/views/widgets/shared/stars_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FloweristProfile extends StatelessWidget {
  const FloweristProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FlowristInProfileControllerImp());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: const CustomAppbarFlowrist(
          title: 'Flowrist details',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///First Row Of Image And Coache Name
                    const SizedBox(height: 15),
                    Row(children: [
                      Container(
                          width: 74.w,
                          height: 74.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/person.png"),
                                  fit: BoxFit.cover))),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ahmed Zayed",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: KzlyColors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600)),
                              Text("Events,Weeding,Bouqet",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: KzlyColors.greyColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500)),
                              Text("Cairo,Egypt",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: KzlyColors.greyColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const StarRating(rating: 4.5),
                                  SizedBox(width: 10.w),
                                  Text("(190 reviews)",
                                      style: TextStyle(
                                          color: KzlyColors.greyColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700)),
                                ],
                              )
                            ]),
                      )
                    ]),
                    SizedBox(height: 20.h),

                    ///Second Row Of certificate and Experience and Reviews
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                  radius: 20,
                                  backgroundColor: KzlyColors.secondry,
                                  child: SvgPicture.asset(
                                      "assets/icons/certificate.svg")),
                              Text("6+",
                                  style: TextStyle(
                                      color: KzlyColors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700)),
                              Text("Certificaate",
                                  style: TextStyle(
                                      color: KzlyColors.greyColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                          SizedBox(width: 15.w),
                          Column(mainAxisSize: MainAxisSize.min, children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: KzlyColors.secondry,
                                child:
                                    SvgPicture.asset("assets/icons/experience.svg")),
                            Text("10+",
                                style: TextStyle(
                                    color: KzlyColors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700)),
                            Text("Experience",
                                style: TextStyle(
                                    color: KzlyColors.greyColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500))
                          ]),
                          SizedBox(width: 15.w),
                          Column(mainAxisSize: MainAxisSize.min, children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: KzlyColors.secondry,
                                child: SvgPicture.asset("assets/icons/review.svg")),
                            Text("110+",
                                style: TextStyle(
                                    color: KzlyColors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700)),
                            Text("Reviews",
                                style: TextStyle(
                                    color: KzlyColors.greyColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500))
                          ]),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "About Florist",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Florist with a passion for floral design, offering an engaging course on the art of working with flowers.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "My Work",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              Assets.images.flower2.path,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                    const SizedBox(height: 24),
                    Text(
                      "Select Section",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GetBuilder<FlowristInProfileControllerImp>(
                        builder: (controller) => Container(
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: KzlyColors.secondryText,
                                ),
                              ),
                              child: DropdownButton(
                                // value: dropdownvalue,
                                value: controller.sectionValue.isNotEmpty
                                    ? controller.sectionValue
                                    : null, // guard it with null if empty
                                hint: Text(
                                  'Your Section',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: KzlyColors.secondryText,
                                  ),
                                ),
                                isExpanded: true,
                                underline: const SizedBox(),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: KzlyColors.secondryText,
                                ),
                                iconSize: 30,
                                items: controller.sections.map((String items) {
                                  return DropdownMenuItem(
                                      value: items, child: Text(items));
                                }).toList(),
                                onChanged: (val) {
                                  controller.onChangeDropDownSection(val.toString());
                                },
                              ),
                            )),
                    const SizedBox(height: 16),
                    Text(
                      "Choose Date",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GetBuilder<FlowristInProfileControllerImp>(
                      builder: (controller) => TextFormField(
                        readOnly: true,
                        keyboardType: TextInputType.url,
                        decoration: InputDecoration(
                            hintText: "Choose date for appointment",
                            prefixIcon: AssetIcon(
                              assetPath: Assets.icons.url,
                              color: KzlyColors.secondryText,
                            )),
                        controller: controller.textEditingController,
                        onTap: () async {
                          controller.selectDate(context);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Select Time",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GetBuilder<FlowristInProfileControllerImp>(
                      builder: (controller) => Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: KzlyColors.secondryText,
                          ),
                        ),
                        child: DropdownButton(
                          items: controller.times.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          // value: dropdownvalue,
                          value: controller.timeValue.isNotEmpty
                              ? controller.timeValue
                              : null,
                          // guard it with null if empty
                          hint: Text(
                            'Select time',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: KzlyColors.secondryText,
                            ),
                          ),
                          isExpanded: true,
                          underline: const SizedBox(),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: KzlyColors.secondryText,
                          ),
                          iconSize: 30,

                          onChanged: (val) {
                            controller.onChangeDropDownTime(val.toString());
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                    Text(
                      "Reviews",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 16),
                      child: RatingSummary(
                          averageRating: 4.5,
                          onTapWriteReview: () => Get.dialog(ReviewDialog(
                          onsubmit: () {},
                          cancel:()=>Get.back(),
                        )),
                        numberOfReviews: 260,
                          ratings: [0.6, 0.4, .9, .3, .1]),
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        separatorBuilder: (context, index) => const Divider(
                              indent: 16,
                              endIndent: 16,
                            ),
                        itemBuilder: (context, index) {
                          /// TODO: ADD Reivew Tile
                          //return const ReviewListTile(
                          //  title: "Title",
                          //  description: "Description",
                          //  rating: 4.5,
                          //);
                        })
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: const BoxDecoration(
              color: Color(0xFFFEFEFE),
              boxShadow: [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 16,
                  offset: Offset(0, 3),
                  spreadRadius: 2,
                )
              ],
            ),
            child: Row(
              children: [
                Opacity(
                  opacity: .7,
                  child: Column(
                    children: [
                      Text(
                        "450 EGP",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: KzlyColors.primary),
                      ),
                      Text(
                        "Mon, 14 June",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "5:00 PM~8:00 PM",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: () {
                    Get.dialog(FloweristDialog(
                      onGo: () {},
                      name: 'Mazen Zekry.',
                    ));
                  },
                  style: ButtonThemes.primary,
                  child: const Text("Confirm Booking"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
