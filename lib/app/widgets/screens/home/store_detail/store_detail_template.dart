import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_menu/organisms/store_detail_menu.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_top/organisms/store_detail_top.dart';
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
          body: TabBarView(children: [
            StoreDetailTop(),
            Icon(Icons.movie),
            StoreDetailMenu(),
            Icon(Icons.games),
          ]),
        )
    );
  }
}

