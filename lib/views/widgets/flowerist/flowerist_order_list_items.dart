import 'package:flowers_store/data/model/florist/florist_order_model.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/class/extentions.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

class FloweristOrderListItems extends StatelessWidget {
  final FloristOrderModel? floristOrderModel;
  final Function()? tapPhoneCall;
  const FloweristOrderListItems(
      {super.key, this.floristOrderModel, this.tapPhoneCall});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    visualDensity: VisualDensity.compact,
                    leading: CircleAvatar(
                        radius: 24,
                        backgroundImage: floristOrderModel
                                    ?.customerModel?.profilePicture?.imageUrl !=
                                null
                            ? NetworkImage(floristOrderModel!
                                .customerModel!.profilePicture!.imageUrl!)
                            : AssetImage(Assets.images.avatar.path)
                                as ImageProvider),
                    title: Text(
                        floristOrderModel?.customerModel?.fullName ?? "No Name"),
                    subtitle: Text(floristOrderModel?.section ?? "No Section"),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 68,
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: floristOrderModel?.status == 'confirmed'
                                  ? KzlyColors.lightgreenColor
                                  : floristOrderModel?.status == "pending"
                                      ? KzlyColors.lightorangeColor
                                      : KzlyColors.lightredColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              floristOrderModel?.status?.capitalize() ?? "No Status",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: floristOrderModel?.status == 'confirmed'
                                    ? KzlyColors.greenColor
                                    : floristOrderModel?.status == "pending"
                                        ? KzlyColors.orangeColor
                                        : KzlyColors.redColor,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        Text(
                            '${DateTime.now().difference(DateTime.parse(floristOrderModel!.date ?? "2024-06-21 03:00:00")).inDays} Days Ago'),
                      ],
                    ),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                    visualDensity: VisualDensity.compact,
                    leading: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 26,
                    ),
                    title: Text(
                      '${floristOrderModel?.day}, ${DateTime.parse(floristOrderModel!.date ?? "2024-06-21 03:00:00").day}\t${DateFormat('MMMM').format(DateTime.parse(floristOrderModel!.date ?? "2024-06-21 03:00:00"))}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    ///Here need From back end to return start hour and end hour like this ("15:00","12:30")
                    subtitle: Text(
                      "${int.parse(floristOrderModel!.startHour!) <= 12 ? '${floristOrderModel!.startHour} AM' : '${int.parse(floristOrderModel!.startHour!) - 12} PM'} ~ ${int.parse(floristOrderModel!.endHour!) <= 12 ? '${floristOrderModel!.endHour} AM' : '${int.parse(floristOrderModel!.endHour!) - 12} PM'} ",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${floristOrderModel?.totalPrice} EGP',
                          style: const TextStyle(
                            color: KzlyColors.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: tapPhoneCall,
                          child: CircleAvatar(
                              radius: 18.r,
                              backgroundColor: KzlyColors.lightPurple,
                              child: const Icon(
                                SolarIconsOutline.phoneCallingRounded,
                                color: KzlyColors.primary,
                                size: 24,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
