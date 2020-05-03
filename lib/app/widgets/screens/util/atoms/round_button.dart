import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

class RoundButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final EdgeInsets padding;
  final VoidCallback onPressedCallback;

  RoundButton({
    Key key,
    this.backgroundColor,
    this.textColor,
    @required this.text,
    @required this.padding,
    @required this.onPressedCallback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: textColor,
      padding: padding,
      child: Text(text),
      color: backgroundColor,
      shape: StadiumBorder(),
      onPressed: onPressedCallback,
    );
  }
}