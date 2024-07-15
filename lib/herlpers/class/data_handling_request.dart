import 'package:flutter/widgets.dart';
import '../shared/lotties/Offine_lottie.dart';
import '../shared/lotties/error404_lottie.dart';
import '../shared/lotties/loading_lottie.dart';
import 'statuscode.dart';

class DataHandlingRequsetState extends StatelessWidget {
  const DataHandlingRequsetState(
      {super.key, required this.statusRequest, required this.widget});
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: statusRequest == StatusRequest.loading
          ? const LoadingLottie()
          : statusRequest == StatusRequest.offlineFailure
              ? const Offline()
              : statusRequest == StatusRequest.serverFailure
                  ? const Error404()
                  : widget,
    );
  }
}
