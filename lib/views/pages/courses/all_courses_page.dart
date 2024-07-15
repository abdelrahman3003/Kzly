import 'package:flowers_store/views/widgets/courses/courses_card.dart';
import 'package:flowers_store/views/widgets/custom_appbar_flowrist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCoursesPage extends StatelessWidget {
  const AllCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child:  CustomAppbarFlowrist(title:"All Courses"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: ListView.separated(
                itemBuilder: (context, index) =>const CoursesCard(imageUrl: "assets/images/male_florist.jpg"),   
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount: 20),
          ),
        ));
  }
}
