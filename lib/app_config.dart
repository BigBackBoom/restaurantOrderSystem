import 'package:flutter/material.dart';
import 'package:letme_app/env/env_config.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required this.appName,
    @required this.flavorName,
    @required this.envConfig,
    @required Widget child,
  }) : super(child: child);

  final String appName;
  final String flavorName;
  final EnvConfigBase envConfig;

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}