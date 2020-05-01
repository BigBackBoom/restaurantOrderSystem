import 'package:flutter/material.dart';

import 'package:letme_app/app_config.dart';
import 'package:letme_app/main.dart';



void main() {
  var configuredApp = new AppConfig(
    appName: 'Letme DEV',
    flavorName: 'Develop',
    child: new MyApp(),
  );

  runApp(configuredApp);
}
