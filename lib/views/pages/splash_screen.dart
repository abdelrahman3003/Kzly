import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigateFunc();
    super.initState();
  }

  void navigateFunc() {
    Future.delayed(const Duration(seconds: 5), () {
     
      Get.offNamed(kOnboardingPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/splash/logo.png",
                width: 127.w, height: 98.h),
          ),
          Positioned(
            top: 142.h,
            left: 0,
            child: Image.asset("assets/images/splash/left_flower.png",
                width: 50.w, height: 90.h),
          ),
          Positioned(
            top: 42.h,
            right: 0,
            child: Image.asset("assets/images/splash/right_flower.png",
                width: 50.w, height: 90.h),
          ),
        ],
      )),
    );
  }
}
