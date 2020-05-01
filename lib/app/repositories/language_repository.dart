

import 'package:letme_app/app/resources/api/language_api_provider.dart';
import 'package:letme_app/app/resources/models/language/language_list.dart';

class LanguageRepository {
  final apiProvider = LanguageApiProvider();

  Future<LanguageList> fetchAllLanguage() {
    return apiProvider.fetchAllLanguage();
  }
}