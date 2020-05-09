import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/theme.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_menu/organisms/store_detail_menu.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_top/organisms/store_detail_top.dart';
import 'package:letme_app/app/widgets/screens/util/atoms/round_button.dart';
import 'package:letme_app/env_resources/strings/localization_strings.dart';

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TAB_SIZE,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
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
                ])
              ],
            ),
          ),
          body: Stack(
            children: <Widget>[
              TabBarView(children: [
                StoreDetailTop(),
                Icon(Icons.movie),
                StoreDetailMenu(),
                Icon(Icons.games),
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

