import 'package:flowers_store/controllers/address/address_controller.dart';
import 'package:flowers_store/herlpers/class/statuscode.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/themes/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditOrAddAddressPage extends GetView<AddressControllerImp> {
  const EditOrAddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            Get.arguments!=null? "Edit Address" : "Add Address",
            style: TextStyle(
                color: KzlyColors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: KzlyColors.purpleBlack,
              size: 24,
            ),
          )),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: GetBuilder<AddressControllerImp>(
                builder: (controller) => Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location name",
                              style: TextStyle(
                                  color: KzlyColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            TextFormField(
                              controller: controller.locationController,
                              style: TextStyle(
                                color: KzlyColors.purpleBlack,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  // return "location name can't be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter location name",
                                hintStyle: TextStyle(
                                  color: const Color(0x99675F6C),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              "Country",
                              style: TextStyle(
                                  color: KzlyColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            TextFormField(
                              controller: controller.countryController,
                              style: TextStyle(
                                color: KzlyColors.purpleBlack,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Country can't be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter your Country Name",
                                hintStyle: TextStyle(
                                  color: const Color(0x99675F6C),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              "City",
                              style: TextStyle(
                                  color: KzlyColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            TextFormField(
                              controller: controller.cityController,
                              style: TextStyle(
                                color: KzlyColors.purpleBlack,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "City can't be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter your City Name",
                                hintStyle: TextStyle(
                                  color: const Color(0x99675F6C),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              "Street",
                              style: TextStyle(
                                  color: KzlyColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            TextFormField(
                              controller: controller.streetController,
                              style: TextStyle(
                                color: KzlyColors.purpleBlack,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "street can't be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter your street",
                                hintStyle: TextStyle(
                                  color: const Color(0x99675F6C),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                    child: customColumn(
                                  headertext: 'Block',
                                  hinttext: '0',
                                  controller: controller.blockController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      // return "block can't be empty";
                                    }
                                    return null;
                                  },
                                )),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                    child: customColumn(
                                  headertext: 'Building',
                                  hinttext: '0',
                                  controller: controller.buildingController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "building can't be empty";
                                    }
                                    return null;
                                  },
                                ))
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                    child: customColumn(
                                  headertext: 'Floor',
                                  hinttext: '0',
                                  controller: controller.floorController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "floor can't be empty";
                                    }
                                    return null;
                                  },
                                )),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                    child: customColumn(
                                  headertext: 'Apartment',
                                  hinttext: '0',
                                  controller: controller.apartmentController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "apartment can't be empty";
                                    }
                                    return null;
                                  },
                                ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                    SizedBox(height: 12.h),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: FilledButton(
                        style: ButtonThemes.primary.copyWith(
                            fixedSize: WidgetStatePropertyAll(Size(Get.width, 48))),
                        child:
                            controller.statusRequest == StatusRequest.createLoading
                                ?  const Center(child: CircularProgressIndicator(color:KzlyColors.white,strokeWidth: 3,))
                                : Text("Save",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: KzlyColors.white)),
                        onPressed: () =>
                            controller.statusRequest == StatusRequest.createLoading
                                ? {}
                                : controller.saveData(),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  Column customColumn(
      {required String headertext,
      required String hinttext,
      TextEditingController? controller,
      String? Function(String?)? validator}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headertext,
          style: TextStyle(
            color: KzlyColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hinttext,
            helperText: "",
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.3.w),
                borderRadius: BorderRadius.circular(4.0)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.3.w),
                borderRadius: BorderRadius.circular(4.0)),
          ),
        ),
      ],
    );
  }
}
