import 'package:flutter/material.dart';

import '../api/api.dart';
import '../models/weekWeather.dart';

getNewData(double? lat, double? lon, int nextDay) {
  return FutureBuilder<WeekWeatherData>(
    future: fetchWeatherWeek(lat!, lon!),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(
          "${snapshot.data!.daily![nextDay].temp!.day}°  ",
          style: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return const CircularProgressIndicator();
    },
  );
}
