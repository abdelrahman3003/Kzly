import 'package:flowers_store/controllers/filter/coache_filter_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/sheets/filters/coach_filter_sheet.dart';
import 'package:flowers_store/views/themes/shadow_themes.dart';
import 'package:flowers_store/views/widgets/coaches/coaches_cards.dart';
import 'package:flowers_store/views/widgets/custom_appbar_flowrist.dart';
import 'package:flowers_store/views/widgets/shared/kzly_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CoachesListPage extends StatelessWidget {
  const CoachesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: const CustomAppbarFlowrist(title: "Coaches list"),
      ),
      body: SafeArea(
          child: ColoredBox(
        color: KzlyColors.backgroundColor,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 12),
              decoration: const BoxDecoration(
                color: Color(0xFFFEFEFE),
                boxShadow: [BoxShadowThemes.mainShadow],
              ),
              child: KzlySearchBar(
                onSubmit: (e) {},
                onFilterPressed: () => CouchesFilterSheet.show(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Courses (20)",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed(kCoacheRegistrationPage),
                    child: Text(
                      "Join Us",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: KzlyColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    controller: ScrollController(),
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) => CoachesCards(
                          onTap: () => Get.toNamed(kCoachDetailsPage),
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 20.h),
                    itemCount: 20))
          ],
        ),
      )),
    );
  }
}
