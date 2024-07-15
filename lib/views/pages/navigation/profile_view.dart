import 'package:flowers_store/controllers/profile/profile_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/dialogs/basic_dialog.dart';
import 'package:flowers_store/views/widgets/shimmer/KzlyShimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ProfileControllerImp>(builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            controller.getUser();
          },
          child: ListView(
            children: [
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Account settings',
                    style: TextStyle(
                      color: Color(0xFF96919A),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                leading:
                    const CircleAvatar(child: Icon(SolarIconsOutline.userCircle)),
                title: const Text('Edit Profile'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed(kMyProfilePage);
                },
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
              ),
              if (controller.statusRequest == StatusRequest.loading&&!controller.getuserType) ...[
                KzlyShimmer.profileListTile(),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                ),
              ],
              if (controller.user.isFlorist) ...[
                ListTile(
                  leading:
                      CircleAvatar(child: SvgPicture.asset(Assets.icons.florist)),
                  title: const Text('Florist Profile'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.toNamed(kFloweristEditProfileView);
                  },
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                ),
              ],
              if (controller.user.isCoach) ...[
                ListTile(
                  leading: CircleAvatar(child: SvgPicture.asset(Assets.icons.coach)),
                  title: const Text('Coach Profile'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.toNamed(kCoachProfile);
                  },
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                ),
              ],
              if (controller.user.isSupplier) ...[
                ListTile(
                    leading: const CircleAvatar(
                        child: Icon(SolarIconsOutline.usersGroupRounded)),
                    title: const Text('Supplier Profile'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Get.toNamed(kSupplierProfilePage);
                    }),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                ),
              ],
              ListTile(
                leading: const CircleAvatar(child: Icon(SolarIconsOutline.mapPoint)),
                title: const Text('My Address'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed(kMyAddressesPage);
                },
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
              ),
              ListTile(
                leading: const CircleAvatar(child: Icon(SolarIconsOutline.card)),
                title: const Text('Payment'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed(kPaymnetPage);
                },
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
              ),
              ListTile(
                leading:
                    const CircleAvatar(child: Icon(SolarIconsOutline.cartLarge)),
                title: const Text('My Orders'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed(kMyOrderPage);
                },
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      color: Color(0xFF96919A),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: CircleAvatar(child: SvgPicture.asset(Assets.icons.global)),
                title: const Text('Language'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => Get.toNamed(kLanguagePage),
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
              ),
              ListTile(
                leading: const CircleAvatar(
                    backgroundColor: KzlyColors.redSecondry,
                    child: Icon(
                      SolarIconsOutline.logout_2,
                      color: KzlyColors.red,
                    )),
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: KzlyColors.red),
                ),
                onTap: () {
                  Get.dialog(GetBuilder<ProfileControllerImp>(builder: (controller) {
                    return BasicDialog(
                        title: "Log out",
                        isLoading: controller.statusRequest == StatusRequest.loading
                            ? true
                            : false,
                        subtitle: "Are you sure you wnat to log out",
                        onNo: () {
                          Get.back();
                        },
                        onYes: () {
                          controller.logout();
                        });
                  }));
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
