import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkAPI {
  NetworkAPI(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String retrievedData = response.body;

      return jsonDecode(retrievedData);
    } else {
      print(response.statusCode);
    }
  }
}
