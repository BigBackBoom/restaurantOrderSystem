import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/resources/models/language/language.dart';

class LanguageItem extends StatelessWidget {

  final Language language;

  LanguageItem({Key key, @required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageName = language.languageName;

    return Container(
      padding: EdgeInsets.all(12),
      decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey[400]))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(languageName),
        ],
      ),
    );
  }
}
