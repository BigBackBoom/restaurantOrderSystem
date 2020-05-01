import 'package:flutter/material.dart';
import 'package:letme_app/app/widgets/screens/select_language/select_language.dart';

import 'package:letme_app/top.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Letme',
      routes: <String, WidgetBuilder>{
        '/': (_) => new Top(),
        '/select_language': (_) => new SelectLanguage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}