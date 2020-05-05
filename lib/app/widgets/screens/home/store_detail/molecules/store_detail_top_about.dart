import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreDetailTopAbout extends StatelessWidget {

  final String imageUrl;
  final String description;

  StoreDetailTopAbout({Key key, @required this.imageUrl, @required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            "About us",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black.withOpacity(0.87)
            )
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(
                top: 12
            ),
            child: Image.network(
              "https://image.jimcdn.com/app/cms/image/transf/none/path/s9ef41e1273f0da09/image/ia0b599d27a0ab398/version/1581082289/image.jpg",
              height: 200,
            ),
          )
        ),
        Container(
          margin: EdgeInsets.only(
              top: 12
          ),
          child: Text(
              "Our store have been opened since 2005.  What we value most is our customer’s smiles.  So please feel free to call me if you have anything.",
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