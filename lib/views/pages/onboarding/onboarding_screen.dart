import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/localization/localization.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:flowers_store/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  AppServices appServices = Get.find();
  bool isLast = false;
  int isFirstPage = 0;
  @override
  void dispose() {
    boardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () { 
                  appServices.sharedPreferences.setString("step", "1");
                  Get.toNamed(kWelcomePage);
                },
                child: Text(AppLocalizations.of(context)!.tr("skip")!,
                    style: TextStyle(
                        color: KzlyColors.purple,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700)),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: OnBoradingModel.languageList(context).length,
                  controller: boardController,
                  onPageChanged: (index) {
                    if (index ==
                        OnBoradingModel.languageList(context).length - 1) {
                      setState(() {
                        isFirstPage = index;
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isFirstPage = index;
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) => buildOnBoardingItem(
                      OnBoradingModel.languageList(context)[index])),
            ),
            Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: isFirstPage == 0 ? false : true,
                      child: FloatingActionButton(
                        heroTag: "btnback",
                        onPressed: () {
                          boardController.previousPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 2.w, color: KzlyColors.purpleBlack),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    _dots(),
                    FloatingActionButton(
                      heroTag: "btnnext",
                      onPressed: () {
                        if (isLast) {
                          appServices.sharedPreferences.setString("step", "1");
                          Get.offNamed(kWelcomePage);
                        } else {
                          boardController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      backgroundColor: KzlyColors.purple,
                      child: isLast
                          ? Text("Go",
                              style: TextStyle(
                                  color: KzlyColors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600))
                          : const Icon(Icons.arrow_forward,
                              color: KzlyColors.white),
                    ),
                  ],
                )),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      )),
    );
  }

  Widget buildOnBoardingItem(OnBoradingModel items) => Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            items.title,
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: KzlyColors.black),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            items.body,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: KzlyColors.secondryText),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Image.asset(
            items.image,
          )),
        ]),
      );

  Widget _dots() {
    return SmoothPageIndicator(
      controller: boardController,
      count: OnBoradingModel.languageList(context).length,
      effect: ExpandingDotsEffect(
        dotColor: Colors.grey,
        activeDotColor: KzlyColors.purple,
        dotHeight: 8.h,
        dotWidth: 22.w,
        spacing: 10,
        expansionFactor: 1.5,
      ),
    );
  }
}
