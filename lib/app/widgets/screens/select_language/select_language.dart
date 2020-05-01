import 'package:flutter/material.dart';
import 'package:letme_app/app/widgets/screens/select_language/select_language_screen.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => new _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SelectLanguageScreen(),
    );
  }
}