import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:letme_app/env_resources/strings/localization_strings.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<LocalizationStrings> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<LocalizationStrings> load(Locale locale) async {
    final localizationStrings = LocalizationStrings(locale);
    await localizationStrings.loadAsset();
    return SynchronousFuture<LocalizationStrings>(localizationStrings);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}