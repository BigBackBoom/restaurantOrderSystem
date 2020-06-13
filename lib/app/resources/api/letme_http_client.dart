import 'dart:convert';

import 'package:http/http.dart';

class LetmeHttpClientFactory{

  static String locale;
  static String timezone;
  static String baseUrl;
  static String token;
  static Map<String, String> _header = {
    "content-type":"application/json",
  };

  static LetmeHttpClient createLetmeHttpClientInstance(){
    _header[LetmeHttpClient.HEADER_TIMEZONE] = timezone;
    _header[LetmeHttpClient.HEADER_LOCALE] = locale;
    // fixme  ログイン処理作成後書き換える
    _header[LetmeHttpClient.HEADER_AUTHORIZATION] = "Token g2TyX7zMMUEozxngZT9rFQ";
    return LetmeHttpClient._internal(_header, baseUrl);
  }

}

class LetmeHttpClient extends BaseClient{

  static const HEADER_AUTHORIZATION = "Authorization";
  static const HEADER_LOCALE = "Locale";
  static const HEADER_TIMEZONE = "Timezone";

  Map<String, String> _header;
  String baseUrl;
  Client _httpClient = Client();

  LetmeHttpClient._internal(this._header, this.baseUrl);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return _httpClient.send(request);
  }

  @override
  Future<Response> get(url, {Map<String, String> headers}) {
    return _httpClient.get("$baseUrl$url", headers: _mergedHeaders(headers));
  }

  @override
  Future<Response> post(url, {Map<String, String> headers, dynamic body, Encoding encoding}) {
    return _httpClient.post("$baseUrl$url", headers: _mergedHeaders(headers), body: body, encoding: encoding);
  }

  @override
  Future<Response> patch(url, {Map<String, String> headers, dynamic body, Encoding encoding}) {
    return _httpClient.patch("$baseUrl$url", headers: _mergedHeaders(headers), body: body, encoding: encoding);
  }

  @override
  Future<Response> put(url, {Map<String, String> headers, dynamic body, Encoding encoding}) {
    return _httpClient.put("$baseUrl$url", headers: _mergedHeaders(headers), body: body, encoding: encoding);
  }

  @override
  Future<Response> head(url, {Map<String, String> headers}) {
    return _httpClient.head("$baseUrl$url", headers: _mergedHeaders(headers));
  }

  @override
  Future<Response> delete(url, {Map<String, String> headers}) {
    return _httpClient.delete("$baseUrl$url", headers: _mergedHeaders(headers));
  }

  Map<String, String> _mergedHeaders(Map<String, String> headers) =>
      {...?_header, ...?headers};

  String createUrl(String base, String endpoint){
    return "$base$endpoint";
  }
}