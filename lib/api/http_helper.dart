import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  static  getRequest(String url, Map<String, dynamic> queryParams) async {

    var uri = Uri.parse(url).replace();
    var newUri = uri.replace(queryParameters: queryParams);
    
    var response = await http.get(newUri);
    
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
    
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return response;
    }
  }

static postRequest(String url, Map<String, dynamic> data) async {
      print('*************************** test start start the post request');

  var encodedData = jsonEncode(data); // Convert the data to a JSON-encoded string
  var response = await http.post(Uri.parse(url), body: encodedData, headers: {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
    
     // Set the content type to indicate JSON data
  });

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
        print('*************************** test pring the data from the post request');

    return jsonResponse;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
}
