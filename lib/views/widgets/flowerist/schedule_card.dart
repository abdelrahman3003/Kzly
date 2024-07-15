import 'package:flowers_store/data/model/schedule/schedule_model.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleCard extends StatelessWidget {
  final bool showDay;
  final List<ScheduleTimeDataModel> schedule;
  const ScheduleCard({super.key, this.showDay = true, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showDay)
                      Text(
                        "Sat",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: KzlyColors.secondry,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Text(
                        "${schedule[index].startHour}\t~\t${schedule[index].endHour}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ])),
          separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
              ),
          itemCount: schedule.length),
    );
  }
}
