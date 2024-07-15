import 'package:equatable/equatable.dart';
import 'package:flowers_store/herlpers/localization/localization.dart';
import 'package:flutter/material.dart';

class OnBoradingModel extends Equatable {
  final String title;
  final String body;
  final String image;

  const OnBoradingModel(
      {required this.title, required this.body, required this.image});

  static List<OnBoradingModel> languageList(BuildContext context) => [
        OnBoradingModel(
            title: AppLocalizations.of(context)!.tr("kazly")!,
            body: AppLocalizations.of(context)!.tr("firstonboarding_body")!,
            image: "assets/images/onboarding/onboarding.png"),
        OnBoradingModel(
            title:
                "${AppLocalizations.of(context)!.tr("kazly")!}\t${AppLocalizations.of(context)!.tr("courses")!}",
            body: AppLocalizations.of(context)!.tr("secondonboarding_body")!,
            image: "assets/images/onboarding/onboarding_courses.png"),
        OnBoradingModel(
            title:
                "${AppLocalizations.of(context)!.tr("kazly")!}\t${AppLocalizations.of(context)!.tr("florist")!}",
            body: AppLocalizations.of(context)!.tr("thirdboarding_body")!,
            image: "assets/images/onboarding/onboarding_florist.png"),
      ];

  @override
  List<Object?> get props => [
        title,
        body,
        image,
      ];
}
