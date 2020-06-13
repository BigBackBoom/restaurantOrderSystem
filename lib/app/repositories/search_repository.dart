import 'package:letme_app/app/resources/api/store_api_provider.dart';
import 'package:letme_app/app/resources/models/response.dart';

class SearchRepository {
  final apiProvider = StoreApiProvider();

  Future<Response> fetchSearchMain(double lat, double lng) {
    return apiProvider.fetchSearchMain(lat, lng);
  }

}