import 'package:flutter/material.dart';

import '../models/todayWeather.dart';

List<Widget> rightside(TodayWeatherData? data) {
  return <Widget>[
    Padding(
      padding: const EdgeInsets.only(bottom: 5, right: 10),
      child: Text(
        "${data!.main!.temp}°",
        style: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
    Text(
      "Humidité: ${data.main!.humidity} %",
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    Text(
      "Vent: ${data.wind!.speed} km/h",
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  ];
}
