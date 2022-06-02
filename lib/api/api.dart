// import 'dart:convert';

// import 'package:app/models/weather.dart';
// import 'package:http/http.dart' as http;

// Future<weather> fetchWeatherData(String city) async {
//   const apiKey = 'b6907d289e10d714a6e88b30761fae22';
//   String url =
//       'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${apiKey}&units=metric';
//   final response = await http.get(Uri.parse(url));
//   if (response.statusCode == 200) {
//     return weather.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load weather data ❌');
//   }
// }
