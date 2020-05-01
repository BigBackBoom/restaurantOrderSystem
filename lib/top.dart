import 'package:flutter/material.dart';
import 'package:letme_app/env.dart';

class Top extends StatefulWidget {
  @override
  _TopState createState() => new _TopState();
}

class _TopState extends State<Top> {

  @override
  Widget build(BuildContext context) {
    final String baseUrl = environment['baseUrl'];
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("hello"),
      ),
      body: new Column(
        children: [
          new Center(
            child: Text("hello"),
          ),
          IconButton(
            icon: (Icon(Icons.star)),
            color: Colors.red[500],
            onPressed: () => Navigator.of(context).pushNamed('/select_language'),
          ),
        ]
      )
    );
  }
}