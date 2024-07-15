import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/views/widgets/shared/other_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OthersView extends StatefulWidget {
  const OthersView({super.key});

  @override
  State<OthersView> createState() => _OthersViewState();
}

class _OthersViewState extends State<OthersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OtherCard(
                  title: "Florist",
                  subtitle:
                      "We made a components of fantastic  florist you can choose anyone from them",
                  imagePath: Assets.illustration.florsitCat,
                  onTap: () {
                    Get.toNamed(kFlowristRegistration);
                  }),
              OtherCard(
                  title: "Coaches",
                  subtitle:
                      "We made a components of fantastic coaches you can learn a lot about flowers",
                  imagePath: Assets.illustration.coachCat,
                  onTap: () {
                    Get.toNamed(kCoachesListPage);
                  }),
              OtherCard(
                  title: "Courses",
                  subtitle:
                      "We made a collections of videos' that you will learn more about them",
                  imagePath: Assets.illustration.traineeCat,
                  onTap: () {
                    Get.toNamed(kCoursesPage);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
