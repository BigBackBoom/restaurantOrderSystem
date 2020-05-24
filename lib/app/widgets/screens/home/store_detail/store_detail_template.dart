import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/blocs/home/store_detail/store_detail_bloc.dart';
import 'package:letme_app/app/resources/models/home/store_detail.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_menu/organisms/store_detail_menu.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_review/organisms/store_detail_review.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_rules/organisms/store_detail_rules.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_top/organisms/store_detail_top.dart';
import 'package:letme_app/app/widgets/screens/util/atoms/round_button.dart';
import 'package:letme_app/env_resources/strings/localization_strings.dart';
import 'package:provider/provider.dart';

class StoreDetailTemplate extends StatefulWidget {
  @override
  _StoreDetailTemplateState createState() => _StoreDetailTemplateState();
}

class _StoreDetailTemplateState extends State<StoreDetailTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new SafeArea(
            child: StoreDetailTab()
        )
    );
  }
}

class StoreDetailTab extends StatefulWidget {
  @override
  _StoreDetailTabState createState() => _StoreDetailTabState();
}

class _StoreDetailTabState extends State<StoreDetailTab> {

  static const int TAB_SIZE = 4;
  StoreDetailBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = Provider.of<StoreDetailBloc>(context);

    return DefaultTabController(
        length: TAB_SIZE,
        child: Scaffold(
          appBar: AppBar(
            title: StreamBuilder(
              stream: _bloc.storeDetail,
              builder: (context, snapshot){
                if(snapshot.hasData) {
                  StoreDetail store = snapshot.data;
                  return Text(store.name);
                } else {
                  return Text("");
                }
              },
            ),
            elevation: 0,
            bottom: TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(LocalizationStrings.of(context).getWithKey("order_detail_tab_top")),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(LocalizationStrings.of(context).getWithKey("order_detail_tab_review")),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(LocalizationStrings.of(context).getWithKey("order_detail_tab_menu")),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(LocalizationStrings.of(context).getWithKey("order_detail_tab_rules")),
                ),
              ),
            ]),
          ),
          body: Stack(
            children: <Widget>[
              TabBarView(children: [
                StoreDetailTop(),
                StoreDetailReview(),
                StoreDetailMenu(),
                StoreDetailRules(),
              ]),
              Positioned(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 12
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: RoundButton(
                          textColor: LetmeAppColor.onColors["primary"],
                          backgroundColor: LetmeAppColor.primary[500],
                          text: LocalizationStrings.of(context).getWithKey("order_detail_check_in_button"),
                          padding: EdgeInsets.only(
                              top: 16,
                              bottom: 12
                          ),
                          onPressedCallback: () {

                          }
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

