import 'dart:convert';

import 'package:app/models/weather.dart';
import 'package:http/http.dart' as http;

Future<WeatherData> fetchWeatherData(String city) async {
  const apiKey = '856822fd8e22db5e1ba48c0e7d69844a';
  String url =
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${apiKey}&units=metric';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return WeatherData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather data ❌');
  }
}
