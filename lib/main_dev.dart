import 'package:flutter/material.dart';
import 'package:letme_app/app/letme_app.dart';
import 'package:letme_app/app/widgets/screens/home/home_page.dart';

import 'package:letme_app/app_config.dart';
import 'package:letme_app/env/env_config.dart';
import 'package:letme_app/main.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'Letme DEV',
    flavorName: 'Develop',
    envConfig: DevelopEnvConfig(),
    child: new LetmeApp(),
  );

  runApp(configuredApp);
}
