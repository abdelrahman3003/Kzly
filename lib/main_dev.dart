import 'package:flowers_store/herlpers/constant/binding.dart';
import 'package:flowers_store/herlpers/constant/colors.dart';
import 'package:flowers_store/herlpers/localization/localization.dart';
import 'package:flowers_store/herlpers/constant/routsApp.dart';
import 'package:flowers_store/herlpers/service/serviece.dart';
import 'package:flowers_store/views/themes/text_forum_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inialServices();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding:AppBinding() ,
        theme: ThemeData(
          inputDecorationTheme: KzlyTextFormFieldTheme.mainTheme,
          appBarTheme: const AppBarTheme(
            color: KzlyColors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          scaffoldBackgroundColor: KzlyColors.white,
          textTheme: GoogleFonts.latoTextTheme(),
          splashColor: Colors.transparent,
          colorScheme: ColorScheme.fromSeed(seedColor: KzlyColors.white),
        ),
        // Add localization delegates and supported locales
        localizationsDelegates: const [
          AppLocalizations.delegate, // Your AppLocalizationsDelegate
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English
          Locale('ar', ''), // Arabic
          // Add more supported locales as needed
        ],
        // Define a fallback locale in case the device locale is not supported
        localeResolutionCallback: (locale, supportedLocales) {
          // Check if the device locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return locale;
            }
          }
          // If the device locale is not supported, fallback to English
          return const Locale('en', '');
        },
        getPages: getPages,
      ),
    );
  }
}
