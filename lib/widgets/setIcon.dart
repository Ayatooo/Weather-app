import 'package:flutter/material.dart';

import '../api/api.dart';
import '../models/weekWeather.dart';
import '../utils/utils.dart';

setIcon(double? lat, double? lon, int nextDay) {
  return FutureBuilder<WeekWeatherData>(
    future: fetchWeatherWeek(lat!, lon!),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Icon(
            getIcon(snapshot.data!.daily![nextDay].weather![0].main.toString()),
            size: 20,
          ),
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return const CircularProgressIndicator();
    },
  );
}
