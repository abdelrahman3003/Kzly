import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Offline extends StatelessWidget {
  const Offline({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 220,
            width: 200,
            child: Lottie.asset("assets/lotties/offline.json")),
        Text("No internet connection", style: TextStyle()),
      ],
    );
  }
}
