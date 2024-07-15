import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/views/pages/supplier/profile/supplier_add_offers.dart';
import 'package:flowers_store/views/pages/supplier/profile/supplier_edit_inforamtion.dart';
import 'package:flowers_store/views/pages/supplier/profile/supplier_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupplierProfilePage extends StatelessWidget {
  const SupplierProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Supplier Profile',
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
                  text: 'My Offers',
                ),
                Tab(
                  text: 'Add Offers',
                )
              ],
            ),
          ),
          body: const TabBarView(children: [
            SupplierEditInformmation(),
            SupplierOffers(),
            SupplierAddOffers()
          ]),
        ));
  }
}
