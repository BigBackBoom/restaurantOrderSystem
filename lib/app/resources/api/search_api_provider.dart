import 'package:letme_app/app/resources/models/home/search_main.dart';

class SearchApiProvider {
  Future<SearchMainContents> fetchSearchMain() async {
    var mock = <String, dynamic>{
      "id": 1,
      "title": "TEST",
      "img_url": "https://eatforum.org/content/uploads/2018/05/table_with_food_top_view_900x700.jpg",
    };
    var mock2 = <String, dynamic>{
      "id": 1,
      "title": "TEST2",
      "img_url": "https://prod-wolt-venue-images-cdn.wolt.com/5b0c10fc852083000b72b2ce/223c0adc3862043f9e4a5be075b19755-edits/5ac7c553c0330bb828d5bb0d292baeb1",
    };

    var mock3 = <String, dynamic>{
      "id": 1,
      "title": "TEST3",
      "img_url": "https://static.toiimg.com/photo/72023714.cms",
    };

    var list = [mock, mock2, mock3];
    var list2 = [mock3, mock2, mock];
    var near = <String, dynamic>{
      "category_id": 1,
      "title": "HAHAHA",
      "restaurant_list": list,
    };

    var categorizedList = <String, dynamic>{
      "category_id": 2,
      "title": "HAHAHA2",
      "restaurant_list": list2,
    };

    var categorizedList2 = <String, dynamic>{
      "category_id": 3,
      "title": "HAHAHA3",
      "restaurant_list": list,
    };

    var finalMock = <String, dynamic>{
      "near_restaurant": near,
      "categoried_restraunts_list": [categorizedList, categorizedList2, categorizedList2],
    };

    return SearchMainContents(finalMock);
  }
}
