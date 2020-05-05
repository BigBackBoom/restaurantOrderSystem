import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreDetailTopHeader extends StatelessWidget {
  final String name;
  final String address;

  StoreDetailTopHeader({Key key, @required this.name, @required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          textAlign: TextAlign.start,
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Text(
            "Cyberpunk/ ¥3000 ~ ¥12000",
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Icon(
              Icons.map,
            )
          ],
        ),
      ],
    );
  }
}
