import 'package:letme_app/app/resources/models/home/store_detail.dart';
import 'package:letme_app/app/resources/models/home/store_menu.dart';
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

}