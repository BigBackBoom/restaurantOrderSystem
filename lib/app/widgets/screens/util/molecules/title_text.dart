import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final bool status;
  final String title;
  final String description;

  TitleTextWidget({Key key, @required this.status, @required this.title, @required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.87)
              )
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 8
          ),
          child: Text(
              description,
              style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.87)
              )
          ),
        )
      ],
    );
  }
}
