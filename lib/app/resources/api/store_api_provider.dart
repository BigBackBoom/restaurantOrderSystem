import 'dart:convert';

import 'package:letme_app/app/resources/api/letme_http_client.dart';
import 'package:letme_app/app/resources/models/error.dart';
import 'package:letme_app/app/resources/models/home/search_main.dart';
import 'package:letme_app/app/resources/models/response.dart';

class StoreApiProvider {

  static const String NEAREST = "api/v1/store/nearest";
  static const String GROUPED = "api/v1/store/group_by_category";

  // TODO need to create model and receive data
  Future<Response> fetchSearchMain(double lat, double lng) async {
    final client = LetmeHttpClientFactory.createLetmeHttpClientInstance();
    final response = await client.get("$NEAREST?lat=$lat\&lng=$lng");

    if (response.statusCode == 200) {
      final data = SearchMainContents(json.decode(response.body));
      return Response(response.statusCode, data);
    } else {
      final errorMap = json.decode(response.body);
      final error = Error(errorMap["error"]);
      return Response(response.statusCode, error);
    }
  }
}
