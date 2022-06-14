import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:e_ticaret/models/weatherModel.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=64f9fbaa331ee0c74ff3719bd0bf117c&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityname);

    return Weather.fromJson(body);
  }
}
