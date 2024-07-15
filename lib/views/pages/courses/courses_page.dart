import 'package:flowers_store/views/sheets/filters/course_filter_sheet.dart';
import 'package:flowers_store/views/widgets/courses/discount_container_widget.dart';
import 'package:flowers_store/views/widgets/courses/for_you_list.dart';
import 'package:flowers_store/views/widgets/courses/top_rating_list.dart';
import 'package:flowers_store/views/widgets/custom_appbar_flowrist.dart';
import 'package:flowers_store/views/widgets/shared/kzly_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: const CustomAppbarFlowrist(title: "Courses"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFEFEFE),
            boxShadow: [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 16,
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                decoration: const BoxDecoration(
                  color: Color(0xFFFEFEFE),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 16,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: KzlySearchBar(
                  onSubmit: (e) {},
                  onFilterPressed: () => CourseFilterSheet.show(),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DiscountContainerWidget(),
                          SizedBox(
                            height: 24.h,
                          ),
                          const TopRatingList(),
                          SizedBox(
                            height: 15.h,
                          ),
                          const ForYouList(),
                          SizedBox(
                            height: 15.h,
                          ),
                        ])),
              )
            ],
          ),
        ));
  }
}
