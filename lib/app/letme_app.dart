import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/app/widgets/screens/home/home_page.dart';
import 'package:letme_app/app/widgets/screens/select_language/select_language.dart';
import 'package:letme_app/env_resources/strings/app_localizations_delegate.dart';

class LetmeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Letme',
      routes: <String, WidgetBuilder>{
        '/': (_) => new HomePage(),
        '/select_language': (_) => new SelectLanguage(),
      },
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // 状況に応じて追加。デザインがJP未対応なためひとまず英語オンリー
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ja', ''),
      ],
      theme: ThemeData(
          primaryColor: LetmeAppColor.primary[500],
          cardColor: LetmeAppColor.surface,
          backgroundColor: LetmeAppColor.background,
          dividerColor: Colors.grey[300],
          brightness: Brightness.light,
          primaryTextTheme: TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
              bodyColor: LetmeAppColor.onColors["primary"],
              displayColor: LetmeAppColor.onColors["primary"]
          ),
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
            bodyColor: LetmeAppColor.onColors["background"],
            displayColor: LetmeAppColor.onColors["background"]
        ),
      )
    );
  }
}

