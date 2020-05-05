import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_page.dart';
import 'package:letme_app/env_resources/strings/localization_strings.dart';

import '../select_language/select_language.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const int SEARCH = 0;
  static const int REVIEWS = 1;
  static const int IM_AT = 2;
  static const int MANAGEMENT = 3;
  static const int MY_PAGE = 4;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.rate_review),
              title: Text("Reviews")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              title: Text("I'm at")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              title: Text("Management")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("MyPage")
          ),
        ],

      ),
      tabBuilder: (BuildContext context, int index) {
        CupertinoTabView tabView;
        switch (index) {
          case SEARCH:
            tabView = CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                      child: StoreDetailPage(
                          id: 1234,
                      )
                  );
                });
            break;
          case REVIEWS:
            tabView = CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                      child: SelectLanguage()
                  );
                });
            break;
          case IM_AT:
            tabView = CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                      child: SelectLanguage()
                  );
                });
            break;
          case MANAGEMENT:
            tabView = CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                      child: SelectLanguage()
                  );
                });
            break;

          case MY_PAGE:
            tabView = CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                      child: SelectLanguage()
                  );
                });
            break;
        }
        return tabView;
      });
  }
}
