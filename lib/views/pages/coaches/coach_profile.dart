import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/pages/coaches/courses_coach.dart';
import 'package:flowers_store/views/widgets/edit_profile_widgets/edit_information.dart';
import 'package:flowers_store/views/widgets/edit_profile_widgets/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CoachProfile extends StatelessWidget {
  const CoachProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: KzlyColors.purpleBlack,
                size: 24,
              ),
            ),
            title: Text(
              'Coach Profile',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
            bottom: TabBar(
              physics: const NeverScrollableScrollPhysics(),
              labelColor: KzlyColors.primary,
              labelStyle: TextStyle(
                fontSize: 12.7.sp,
                fontWeight: FontWeight.w700,
              ),
              indicatorColor: KzlyColors.primary,
              tabs: const <Widget>[
                Tab(
                  text: 'Information',
                ),
                Tab(
                  text: 'Schedule',
                ),
                Tab(
                  text: 'Your Courses',
                )
              ],
            ),
          ),
          body: const TabBarView(children: [
            EditInformation(
              isFlowerist: false,
            ),
            Schedule(
              isFlowerist: false,
            ),
            CoursesCoach()
          ]),
        ));
  }
}
