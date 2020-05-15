import 'package:letme_app/app/resources/models/home/store_detail.dart';
import 'package:letme_app/app/resources/models/home/store_menu.dart';
import 'package:letme_app/app/resources/models/home/store_reviews.dart';
import 'package:letme_app/app/resources/models/home/store_rules.dart';

class StoreDetailApiProvider {

  Future<StoreDetail> fetchStoreDetail(int id) async {

    var mock = <String, dynamic>{
      'store_id': 1234,
      'name': "Eromanga island",
      'address': "chiyoda_ku"
    };

    return StoreDetail(mock);
  }

  Future<StoreMenuList> fetchStoreMenuList(int id) async {

    var mock = <String, dynamic> {
      "id": 123124,
      "name": "Veal",
      "price": 1234,
      "img": "https://usui-hon.com/veal.png"
    };
    var mock2 = <String, dynamic> {
      "id": 1,
      "name": "Food",
      "menu": [mock]
    };

    var list = [mock2];
    var data =  <String, dynamic> {
      "data":list
    };

    return StoreMenuList.fromJson(data);
  }

  Future<StoreRulesList> fetchStoreRules(int id) async {

    var mock = <String, dynamic> {
      "title": "Fee Paytment System",
      "description": "1.  The table charge is 300 yen, but one fixed service menu will be served.  This system is very popular in Japan,  called “OTOSHI”.\n2.  Please do not shout, smoke, and tap the table.  Thank you for your cooperation.",
    };
    var mock2 = <String, dynamic> {
      "title": "No Smoking Policy ",
      "description": "Please do not smoke in the store. We provide area spcifically for smoking",
    };

    var mock3 = <String, dynamic> {
      "title": "Refund Policy",
      "description": "In case, a customer will not able to show up due to accidents in public transport or natural disaster(e.g. bushfire, tyhpoon, etc), we will not charge you any fee",
    };

    var list = [mock, mock2, mock3];
    var data =  <String, dynamic> {
      "data":list
    };

    return StoreRulesList.fromJson(data);
  }

  Future<StoreReviewList> fetchStoreReviews(int id) async {

    var mock = <String, dynamic> {
      "title": "very nice place ",
      "description":"I visited this pub after my work. It was pretty nice place",
      "user_image": "https://eiga.k-img.com/images/person/34117/300x.jpg",
      "review_image": [
        "https://eatforum.org/content/uploads/2018/05/table_with_food_top_view_900x700.jpg",
        "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg?w=1155&h=1528",
        "https://static01.nyt.com/images/2020/03/03/well/physed-foods/physed-foods-mediumSquareAt3X.jpg",
        "https://www.diabetes.co.uk/wp-content/uploads/2019/01/iStock-10131071761-1.jpg",
      ]
    };
    var mock2 = <String, dynamic> {
      "title": "delicious foods",
      "description":"You are still hesitating to come here? Everthing is nice in here",
      "user_image": "https://yumeijinhensachi.com/wp-content/uploads/2017/12/06-24.jpg",
      "review_image": [
        "https://eatforum.org/content/uploads/2018/05/table_with_food_top_view_900x700.jpg",
        "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg?w=1155&h=1528",
        "https://static01.nyt.com/images/2020/03/03/well/physed-foods/physed-foods-mediumSquareAt3X.jpg",
        "https://www.diabetes.co.uk/wp-content/uploads/2019/01/iStock-10131071761-1.jpg",
        "https://www.diabetes.co.uk/wp-content/uploads/2019/01/iStock-10131071761-1.jpg",
      ]
    };

    var mock3 = <String, dynamic> {
      "title": "eek! it was digusting",
      "description":"I saw a cockroach. They should close down now",
      "user_image": "https://pbs.twimg.com/media/D4mB-zpU0AA-dcL.jpg",
      "review_image": [
        "https://eatforum.org/content/uploads/2018/05/table_with_food_top_view_900x700.jpg",
        "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg?w=1155&h=1528",
        "https://static01.nyt.com/images/2020/03/03/well/physed-foods/physed-foods-mediumSquareAt3X.jpg",
      ]
    };

    var mock4 = <String, dynamic> {
      "title": "Wanna come here again",
      "description":"my all time best restaurant. jus visit here, and you will enjoy.",
      "user_image": "https://pbs.twimg.com/profile_images/1159786260627709954/lulrLmk3.jpg",
      "review_image": [
        "https://eatforum.org/content/uploads/2018/05/table_with_food_top_view_900x700.jpg",
      ]
    };

    var list = [mock, mock2, mock3, mock4];
    var data =  <String, dynamic> {
      "data":list
    };

    return StoreReviewList.fromJson(data);
  }
}