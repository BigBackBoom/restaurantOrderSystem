import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:letme_app/app/routes.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/app/widgets/screens/home/home_page.dart';
import 'package:letme_app/env_resources/strings/app_localizations_delegate.dart';

class LetmeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Letme',
        routes: <String, WidgetBuilder>{
          Routes.home: (_) => new HomePage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          CupertinoPageRoute route;
          switch (settings.name) {
            case Routes.home:
              route = CupertinoPageRoute(
                  builder: (_) => HomePage(), settings: settings);
              break;
          }
          return route;
        },
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
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
          iconTheme: IconThemeData(
            color: LetmeAppColor.onColors["primary"],
          ),
          primaryTextTheme: TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
            headline6: TextStyle(),
          ).apply(
              bodyColor: LetmeAppColor.onColors["primary"],
              displayColor: LetmeAppColor.onColors["primary"]),
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 14),
            bodyText2: TextStyle(fontSize: 14),
          ).apply(
              bodyColor: LetmeAppColor.onColors["background"],
              displayColor: LetmeAppColor.onColors["background"]),
        ));
  }
}
