import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/env_resources/strings/localization_strings.dart';

typedef OnClickCallback = void Function();

class SearchTextFieldDummy extends StatefulWidget {

  final OnClickCallback callback;

  SearchTextFieldDummy({Key key, this.callback}) : super(key: key);

  @override
  _SearchTextFieldDummyState createState() => _SearchTextFieldDummyState(onClick: callback);
}

class _SearchTextFieldDummyState extends State<SearchTextFieldDummy> {

  final controller = TextEditingController();
  OnClickCallback onClick;

  _SearchTextFieldDummyState({this.onClick}) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onClick != null){
          onClick();
        }
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
            title: new Text(
              LocalizationStrings.of(context).getWithKey("home_search_dummy_hint"),
              style: TextStyle(
                  color: Colors.black26
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