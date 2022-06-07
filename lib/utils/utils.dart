// ignore: file_names
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

List<String> cities = [];

String setbackground(String currentWeather) {
  String background = "";

  switch (currentWeather) {
    case "Thunderstorm":
      background = "assets/pictures/orage.jpg";
      break;
    case "Drizzle":
      background = "assets/pictures/drizzle.jpg";
      break;
    case "Rain":
      background = "assets/pictures/rain.jpg";
      break;
    case "Snow":
      background = "assets/pictures/snow.jpg";
      break;
    case "Atmosphere":
      background = "assets/pictures/atmosphere.jpg";
      break;
    case "Clear":
      background = "assets/pictures/soleil.jpeg";
      break;
    case "Clouds":
      background = "assets/pictures/nuageux.jpg";
      break;
    default:
      background = "assets/pictures/thunderstorm.jpg";
  }

  return background;
}

IconData getIcon(String weather) {
  switch (weather) {
    case "Clear":
      return WeatherIcons.day_sunny;
    case "Clouds":
      return WeatherIcons.cloud;
    case "Rain":
      return WeatherIcons.rain;
    case "Snow":
      return WeatherIcons.snow;
    case "Thunderstorm":
      return WeatherIcons.thunderstorm;
    default:
      return WeatherIcons.day_sunny;
  }
}

Color getColor(String weather) {
  switch (weather) {
    case "Clear":
      return Colors.orange;
    case "Clouds":
      return Colors.blue;
    case "Rain":
      return Colors.blue;
    case "Snow":
      return Colors.blue;
    case "Thunderstorm":
      return Colors.yellow;
    default:
      return Colors.orange;
  }
}

