import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/get_box_key.dart';

import '../constant/theme.dart';
import '../services/app.service.dart';

class LocalController extends GetxController {
  Locale? initLanguages;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changeLanguage(String languageCode) async {
    Locale locale = Locale(languageCode);
    myServices.getBox.write(GetBoxKey.language, languageCode);
    if (languageCode == 'ar') {
      appTheme = themeArabic;
    } else {
      appTheme = themeEnglish;
    }
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLanguages = myServices.getBox.read(GetBoxKey.language);
    if (sharedPrefLanguages == 'ar') {
      initLanguages = const Locale('ar');
      appTheme = themeArabic;
    } else if (sharedPrefLanguages == 'en') {
      initLanguages = const Locale('en');
      appTheme = themeEnglish;
    } else {
      initLanguages = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
