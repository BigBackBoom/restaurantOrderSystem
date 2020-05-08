import 'package:letme_app/app/resources/api/store_detail_api_provider.dart';
import 'package:letme_app/app/resources/models/home/store_detail.dart';
import 'package:letme_app/app/resources/models/home/store_menu.dart';

class StoreDetailRepository {
  final apiProvider = StoreDetailApiProvider();

  Future<StoreDetail> fetchStoreDetail(int id) {
    return apiProvider.fetchStoreDetail(id);
  }

  Future<StoreMenuList> fetchStoreMenuList(int id) {
    return apiProvider.fetchStoreMenuList(id);
  }
}
