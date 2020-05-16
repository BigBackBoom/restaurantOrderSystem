import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/env_resources/strings/localization_strings.dart';

typedef OnClickCallback = void Function();

class SearchTextField extends StatefulWidget {

  final OnClickCallback callback;

  SearchTextField({Key key, this.callback}) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState(onClick: callback);
}

class _SearchTextFieldState extends State<SearchTextField> {

  final controller = TextEditingController();
  OnClickCallback onClick;

  _SearchTextFieldState({this.onClick}) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onClick();
      },
      child: Card(
          elevation: 0,
          color: LetmeAppColor.primary[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
          child: new ListTile(
            leading: new Icon(
              Icons.search,
              color: Colors.black26,
            ),
            title: new TextField(
              controller: controller,
              decoration: new InputDecoration(
                  hintText: LocalizationStrings.of(context).getWithKey("home_search_dummy_hint"),
                  hintStyle: TextStyle(
                      color: Colors.black26
                  ),
                  border: InputBorder.none
              ),
            ),
            trailing: new IconButton(
              icon: new Icon(Icons.cancel),
              onPressed: () {
                controller.clear();
                // onSearchTextChanged('');
              },
            ),
          )
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}