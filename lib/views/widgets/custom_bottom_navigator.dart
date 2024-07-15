import 'package:flowers_store/controllers/home_controller.dart';
import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';

class AppBottomNavigatorBar extends StatelessWidget {
  const AppBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
   
      builder: (controller) => Stack(
        children: <Widget>[
          BottomNavigationBar(
            onTap: (value) => controller.changepage(value),
            selectedItemColor: KzlyColors.primary,
            unselectedItemColor: KzlyColors.black,
            showUnselectedLabels: true,
            elevation: 0,
            showSelectedLabels: true,
            enableFeedback: false,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedLabelStyle: const TextStyle(height: 2),
            unselectedLabelStyle: const TextStyle(height: 2),
            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.pageCount,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.home,
                  colorFilter:
                      const ColorFilter.mode(KzlyColors.black, BlendMode.srcIn),
                ),
                label: AppLocalizations.of(context)!.tr("home"),
                activeIcon: SvgPicture.asset(
                  Assets.icons.home,
                  colorFilter:
                      const ColorFilter.mode(KzlyColors.primary, BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.icons.cart),
                activeIcon: SvgPicture.asset(
                  Assets.icons.cart,
                  colorFilter:
                      const ColorFilter.mode(KzlyColors.primary, BlendMode.srcIn),
                ),
                label: AppLocalizations.of(context)!.tr("cart"),
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  SolarIconsOutline.reorder,
                  size: 25,
                ),
                activeIcon:
                    Icon(SolarIconsOutline.reorder, color: KzlyColors.primary),
                label: "More",
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  SolarIconsOutline.heart,
                  color: KzlyColors.black,
                ),
                activeIcon: const Icon(
                  SolarIconsOutline.heart,
                  color: KzlyColors.primary,
                ),
                label: AppLocalizations.of(context)!.tr("favorites"),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.icons.profile),
                activeIcon: SvgPicture.asset(Assets.icons.profile,
                    colorFilter:
                        const ColorFilter.mode(KzlyColors.primary, BlendMode.srcIn)),
                label: AppLocalizations.of(context)!.tr("profile"),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            bottom: 3,
            left: ((MediaQuery.of(context).size.width / 5) *
                    controller.pageCount.toDouble()) +
                ((MediaQuery.of(context).size.width / 5) * 0.2) +
                (((MediaQuery.of(context).size.width / 5) * 0.6) / 4),
            child: Container(
              height: 4,
              width: ((MediaQuery.of(context).size.width / 5) * 0.6) / 2,
              decoration: const BoxDecoration(
                color: KzlyColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
