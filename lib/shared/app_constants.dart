import 'package:test/language_models/models.dart';

class AppConstants {
  static String COUNTRY_CODE = "language_Country";
  static String Language_CODE = "language_Code";

  static List<LanguageModel> languages = [
    LanguageModel(
        imgUrl: "imgUrl",
        languageCode: "en",
        languageCountry: "US",
        languageName: "English"),
    LanguageModel(
        imgUrl: "imgUrl",
        languageCode: "es",
        languageCountry: "ES",
        languageName: "Spanish")
  ];
}
