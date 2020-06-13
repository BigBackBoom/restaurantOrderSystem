import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/resources/api/letme_http_client.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/app/widgets/screens/home/home_page.dart';
import 'package:letme_app/app_config.dart';
import 'package:splashscreen/splashscreen.dart';

class LetmeSplash extends StatefulWidget {
  @override
  _LetmeSplashState createState() => new _LetmeSplashState();
}

class _LetmeSplashState extends State<LetmeSplash> {
  @override
  Widget build(BuildContext context) {
   _initLetmeHttpClient(context);

    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: HomePage(),
        image: new Image.asset("assets/img/letme_logo.png"),
        backgroundColor: LetmeAppColor.onColors["primary"],
        photoSize: 100.0,
    );
  }

  void _initLetmeHttpClient(BuildContext context){
    LetmeHttpClientFactory.locale = Localizations.localeOf(context).languageCode.toString();
    LetmeHttpClientFactory.timezone = DateTime.now().timeZoneName;
    LetmeHttpClientFactory.baseUrl = AppConfig.of(context).envConfig.baseUrl;
  }
}