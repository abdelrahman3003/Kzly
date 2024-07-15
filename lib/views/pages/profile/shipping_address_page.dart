import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShippingAddressPage extends StatelessWidget {
  const ShippingAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shipping Address'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return ListTile(
                leading: SvgPicture.asset(Assets.icons.flags.ksa),
                title: const Text('Saudi Arabia'),
                subtitle: const Text('Riyadh, Al-Malaz, 1234'),
                trailing: TextButton(
                  child: const Text('Remove',
                      style: TextStyle(color: KzlyColors.red)),
                  onPressed: () {},
                ),
              );
            }));
  }
}
