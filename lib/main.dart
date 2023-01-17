import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/language_controller.dart';
import 'package:test/homepage.dart';
import 'package:test/message.dart';
import 'package:test/shared/app_constants.dart';
import 'util/depfile.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding();
  Map<String, Map<String, String>> _languages = await dep.init();
  runApp(MyApp(
    languages: _languages,
  ));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;

  MyApp({required this.languages});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationContorller) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: localizationContorller.local,
        title: 'Flutter Demo',
        translations: Messages(languages: languages),
        fallbackLocale: Locale(AppConstants.languages[0].languageCode,
            AppConstants.languages[0].languageCountry),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home_Page(),
      );
    });
  }
}
