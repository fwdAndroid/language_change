import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/controller/language_controller.dart';
import 'package:test/language_models/models.dart';
import 'package:test/shared/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedpref = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedpref);
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  Map<String, Map<String, String>> _languages = Map();
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString("assets/lang/${languageModel.languageCode}.json");

    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();

    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages[
            '${languageModel.languageCode}_${languageModel.languageCountry}'] =
        _json;
  }
  return _languages;
}
