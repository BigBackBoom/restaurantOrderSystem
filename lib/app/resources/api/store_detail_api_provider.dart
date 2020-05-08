import 'package:letme_app/app/resources/models/home/store_detail.dart';
import 'package:letme_app/app/resources/models/home/store_menu.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_menu/organisms/store_detail_menu.dart';

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

}