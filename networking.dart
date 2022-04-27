import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future getWeatherData() async {
    // response => 
    http.Response response = await http.get(Uri.parse(url));

    // 200 means no error
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      return data; 
      //print(data);
    } else {
      print(response.statusCode);
    }
  }
}

//e99827760e9f28354066d9d6a45a6579
//URL
//https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}