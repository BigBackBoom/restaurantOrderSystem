import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/blocs/select_language/language_all_bloc.dart';
import 'package:letme_app/app/resources/models/language/language.dart';
import 'package:letme_app/app/resources/models/language/language_list.dart';
import 'package:letme_app/app/widgets/screens/select_language/language_item.dart';
import 'package:provider/provider.dart';

class SelectLanguageContainer extends StatefulWidget {
  @override
  SelectLanguageContainerState createState() => SelectLanguageContainerState();
}

class SelectLanguageContainerState extends State<SelectLanguageContainer> {
  LanguageAllBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = Provider.of<LanguageAllBloc>(context);
    return StreamBuilder(
      stream: _bloc.allLanguage,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          LanguageList languageList = snapshot.data;
          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: languageList.languageList.length,
            itemBuilder: (BuildContext context, int index) {
              return LanguageItem(language:languageList.languageList[index]);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
