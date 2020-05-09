import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/blocs/home/store_detail/store_detail_rules_bloc.dart';
import 'package:letme_app/app/resources/models/home/store_rules.dart';
import 'package:letme_app/app/widgets/screens/util/molecules/title_text.dart';
import 'package:provider/provider.dart';

class StoreDetailRules extends StatefulWidget {
  @override
  _StoreDetailRulesState createState() => _StoreDetailRulesState();
}

class _StoreDetailRulesState extends State<StoreDetailRules> {

  StoreDetailRulesBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = Provider.of<StoreDetailRulesBloc>(context);

    return StreamBuilder(
        stream: _bloc.storeRules,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            StoreRulesList storeRulesList = snapshot.data;

            List<Widget> mock = [];
            for (var i = 0; i < storeRulesList.storeRules.length; i++) {
              var rule = Container(
                margin: EdgeInsets.only(
                  top: 16,
                ),
                child: TitleTextWidget(
                  title: storeRulesList.storeRules[i].title,
                  description: storeRulesList.storeRules[i].description,
                ),
              );
              mock.add(rule);
            }

            return  SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    top: 24,
                    right: 24,
                    left: 24,
                    bottom: 100
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: mock,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

}