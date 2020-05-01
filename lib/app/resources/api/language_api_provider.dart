import 'dart:convert';

import 'package:http/http.dart';
import 'package:letme_app/app/resources/models/language/language_list.dart';

class LanguageApiProvider {
  Client client = Client();
  // final String base = environment["baseUrl"];
  final String base = "http://localhost:3000/";

  Future<LanguageList> fetchAllLanguage() async {
    final String endpoint = "languages.json";
    final response = await client.get(_createUrl(endpoint));

    if (response.statusCode == 200) {
      return LanguageList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Search failed");
    }
  }

  _createUrl(String endpoint) {
    return "$base$endpoint";
  }
}