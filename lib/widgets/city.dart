import 'package:flutter/material.dart';

import '../models/todayWeather.dart';

Padding city(TodayWeatherData? data) {
  return Padding(
    padding: const EdgeInsets.only(top: 90, bottom: 20),
    child: Text(
      "${data!.name}",
      style: const TextStyle(
        fontSize: 50,
        color: Color.fromARGB(255, 255, 255, 255),
        fontFamily: 'Courrier',
      ),
    ),
  );
}
