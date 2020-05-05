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
        items:  <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(LocalizationStrings.of(context).getWithKey("home_bottom_nav_search")),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            title: Text(LocalizationStrings.of(context).getWithKey("home_bottom_nav_reviews")),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            title: Text(LocalizationStrings.of(context).getWithKey("home_bottom_nav_im_at")),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text(LocalizationStrings.of(context).getWithKey("home_bottom_nav_management")),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(LocalizationStrings.of(context).getWithKey("home_bottom_nav_my_page")),
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
