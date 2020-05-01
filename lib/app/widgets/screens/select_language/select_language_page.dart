import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/widgets/screens/select_language/select_language_container.dart';

class SelectLanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search Result'),
        ),
        body: Container(
          child: SelectLanguageContainer(),
        )
    );
  }
}
