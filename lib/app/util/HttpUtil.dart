import 'package:http/http.dart';

class HttpUtil{

  HttpUtil();

  static Client createClient(String url){
    Client client = Client();

    Map<String, String> headerMap = {
      "": ""
    };

    client.head(
        url,
        headers: headerMap
    );

    return client;
  }

}