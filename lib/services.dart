import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/pages/models.dart';

class WeatherServices {
  String baseUrl =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/';
  String apiKey = 'RAF2MYDHKZ9MG8CTCAU7Q6WCN';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/$cityName?key=$apiKey');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
