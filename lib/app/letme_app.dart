import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/widgets/screens/home/home_page.dart';
import 'package:letme_app/app/widgets/screens/select_language/select_language.dart';

class LetmeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Letme',
      routes: <String, WidgetBuilder>{
        '/': (_) => new HomePage(),
        '/select_language': (_) => new SelectLanguage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}