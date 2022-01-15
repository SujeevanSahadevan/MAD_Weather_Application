//Need to import http package here and it would be easier to rename it as just http

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/datafolder/data_model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
// api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParams = {
      'q': city,
      'appid': 'dececc81d26142daa81c76db7f503ce8',
      'units': 'metric'
    };

    final uri =
        Uri.http('api.openweathermap.org', '/data/2.5/weather', queryParams);

    final response = await http.get(uri);

    //print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
