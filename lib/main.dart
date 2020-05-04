import 'package:flutter/material.dart';
import 'package:letme_app/app/letme_app.dart';
import 'package:letme_app/app_config.dart';
import 'package:letme_app/env_resources/env_config.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'Letme',
    flavorName: 'Production',
    envConfig: EnvConfig(),
    child: new LetmeApp(),
  );

  runApp(configuredApp);
}
