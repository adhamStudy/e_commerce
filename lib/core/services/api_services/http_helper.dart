import 'dart:convert';
import 'package:http/http.dart' as http;
class HttpHelper {
  static Future getRequest(String url, Map<String, dynamic> queryParams) async {

    var uri = Uri.parse(url).replace();
    var newUri = uri.replace(queryParameters: queryParams);
    
    var response = await http.get(newUri);
    
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return response;
    }
  }


static Future postRequest({
  required String url,
  required Map data,
  Map<String, dynamic>? query,
  String? token,
}) async {
  try {
   
    var response = await http.post(
      Uri.parse(url),
      body: data,
    );

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var jsonResponse = jsonDecode(response.body);
        print('*************************** test print the data from the post request');
        return jsonResponse;
      } else {
        print('Response body is empty.');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('An error occurred $e');
  }
}
}
