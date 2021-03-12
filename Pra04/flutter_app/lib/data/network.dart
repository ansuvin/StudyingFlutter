import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  final String authority;
  final String unencodedPath;


  Network(this.authority, this.unencodedPath);

  Future<dynamic> getJsonData() async {
    var url = Uri.https(authority, unencodedPath);
    http.Response response = await http.get(url);
    if(response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);

      return parsingData;
    }
  }
}