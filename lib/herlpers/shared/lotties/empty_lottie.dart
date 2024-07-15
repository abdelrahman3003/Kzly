import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyLottie extends StatelessWidget {
  const EmptyLottie({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset("assets/lotties/empty.json"),
        Text("No Data Found", style: TextStyle()),
      ],
    );
  }
}
