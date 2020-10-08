import 'package:flutter/material.dart';
import 'package:ghaselk/utils/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum locales { ar, en }

class LangRepo {
  Future<bool> hasLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String localeName = prefs.getString(langKey);
    return localeName != null && localeName != '';
  }

  Future setLocale({@required locales locale}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (locale) {
      case locales.ar:
        prefs.setString(langKey, 'ar');
        break;
      case locales.en:
        prefs.setString(langKey, 'en');
        break;
    }
  }

  Future<String> getLocaleCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String localeCode = prefs.getString(langKey);
    if (localeCode != null && localeCode != '') {
      return localeCode;
    } else {
      return 'ar';
    }
  }
}
