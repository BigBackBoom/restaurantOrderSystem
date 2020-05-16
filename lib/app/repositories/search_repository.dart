import 'package:letme_app/app/resources/api/search_api_provider.dart';
import 'package:letme_app/app/resources/models/home/search_main.dart';

class SearchRepository {
  final apiProvider = SearchApiProvider();

  Future<SearchMainContents> fetchSearchMain() {
    return apiProvider.fetchSearchMain();
  }

}