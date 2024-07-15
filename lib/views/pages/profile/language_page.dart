import 'package:flowers_store/controllers/language/language_controller.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/widgets/shared/kzly_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: KzlyColors.purpleBlack,
              size: 24,
            )),
        title: Text(
          'Language',
          style: TextStyle(
              color: KzlyColors.purpleBlack,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: GetBuilder<LanguageController>(builder: (controller) {
          return Column(
            children: [
              KzlySearchBar(
                  borderRadius: 25,
                  onSubmit: (value) => controller.searchinglanguages(value)),
              SizedBox(
                height: 24.h,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) => DecoratedBox(
                    decoration: BoxDecoration(
                        color: controller.languagechoice != controller.displayList[index]["language"]
                            ? KzlyColors.white
                            : KzlyColors.lightpink.withOpacity(0.5),
                        border: Border.all(
                            color: controller.languagechoice != controller.displayList[index]["language"]
                                ? KzlyColors.white
                                : KzlyColors.primary,
                            width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: RadioListTile(
                        value: controller.displayList[index]["language"],
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                        groupValue: controller.languagechoice,
                        onChanged: (value) => controller.selectlanguage(value!),
                        activeColor: KzlyColors.purpleBlack,
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              controller.displayList[index]["flag"],
                              width: 50.w,
                              height: 50.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: Text(
                                controller.displayList[index]["language"],
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: KzlyColors.purpleBlack,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        )),
                  ),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(
                    height: 16.h,
                  ),
                  itemCount: controller.displayList.length,
                ),
              ),
            ],
          );
        }),
      )),
    );
  }
}
