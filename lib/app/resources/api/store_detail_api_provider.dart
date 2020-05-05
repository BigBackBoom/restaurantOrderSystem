import 'package:letme_app/app/resources/models/home/store_detail.dart';

class StoreDetailApiProvider {

  Future<StoreDetail> fetchStoreDetail(int id) async {

    var mock = <String, dynamic>{
      'store_id': 1234,
      'name': "Eromanga island",
      'address': "chiyoda_ku"
    };

    return StoreDetail(mock);
  }

}