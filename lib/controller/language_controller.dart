import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/language_models/models.dart';
import 'package:test/shared/app_constants.dart';

class LocalizationController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }
  Locale _locale = Locale(AppConstants.languages[0].languageCode,
      AppConstants.languages[0].languageCountry);
  Locale get local => _locale;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  List<LanguageModel> _languages = [];

  List<LanguageModel> get languages => _languages;

  void loadCurrentLanguage() {
    _locale = Locale(
        sharedPreferences.getString(AppConstants.Language_CODE) ??
            AppConstants.languages[0].languageCode,
        sharedPreferences.getString(AppConstants.COUNTRY_CODE) ??
            AppConstants.languages[0].languageCountry);

    for (int index = 0; index < AppConstants.languages.length; index++) {
      if (AppConstants.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }

  void setLanguage(Locale locale) {
    Get.updateLocale(_locale);
    _locale = locale;
    saveLanguage(_locale);
    update();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void saveLanguage(Locale local) {
    sharedPreferences.setString(AppConstants.Language_CODE, local.languageCode);
    sharedPreferences.setString(AppConstants.COUNTRY_CODE, local.countryCode!);
  }
}
