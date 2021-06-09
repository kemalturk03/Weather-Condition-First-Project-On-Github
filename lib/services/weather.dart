import 'dart:async';
import 'dart:convert';

import 'package:api_exercises/services/location.dart';
import 'package:http/http.dart' as http;

const String weatherStackUrl = 'http://api.weatherstack.com/forecast';
const String ApiKey = 'd33915faa800b759579b4d91bb23858d';

class Weather {
  Future<dynamic> searchedWeatherData(String cityName) async {
    String requestURL = '$weatherStackUrl?access_key=$ApiKey&query=$cityName';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print("Error Occurred${response.statusCode}");
    }
  }

  Future<dynamic> locationWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    /*################################################*/
    String requestURL =
        '$weatherStackUrl?access_key=$ApiKey&query=${location.latitude},${location.longitude}';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print("Error Occurred${response.statusCode}");
    }
  }
}
