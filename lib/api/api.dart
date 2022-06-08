import 'dart:convert';

import 'package:app/models/todayWeather.dart';
import 'package:app/models/weekWeather.dart';
import 'package:http/http.dart' as http;

Future<TodayWeatherData> fetchWeatherToday(String city) async {
  const apiKey = '09f1856c6f7a6a15cbf72e4eadd6c77d';
  String url =
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return TodayWeatherData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather data ❌');
  }
}

Future<WeekWeatherData> fetchWeatherWeek(double lat, double lon) async {
  const apiKey = '09f1856c6f7a6a15cbf72e4eadd6c77d';
  String url =
      'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=current,hourly,minutely,alerts&units=metric&appid=$apiKey';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return WeekWeatherData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather data ❌');
  }
}
