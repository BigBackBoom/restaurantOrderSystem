import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class LocalizationStrings {
  LocalizationStrings(this.locale);

  final Locale locale;

  final Map<String, String> path = {
    "en" : 'assets/json/string_en.json',
    "ja" : 'assets/json/string_ja.json'
  };

  static final Map<String, Map<String, dynamic>> _localizedValues = {};

  static LocalizationStrings of(BuildContext context) {
    return Localizations.of<LocalizationStrings>(context, LocalizationStrings);
  }

  Future<bool> loadAsset() async{
    for(String key in path.keys) {
      final jsonString = await rootBundle.loadString(path[key]);
      _localizedValues.putIfAbsent(key, () => json.decode(jsonString));
    }
    return true;
  }

  String getWithKey(String key) => _localizedValues[locale.languageCode][key];
}
