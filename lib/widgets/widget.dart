import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import '../models/weather.dart';
import '../utils/setBackground.dart';

BoxDecoration background() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(setbackground("Clear")),
      fit: BoxFit.cover,
    ),
  );
}

Padding city({required String cityName}) {
  return Padding(
    padding: const EdgeInsets.only(top: 50, bottom: 20),
    child: Text(
      cityName,
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

SizedBox todayWeatherBoard(WeatherData? data) {
  return SizedBox(
    width: 300,
    height: 150,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //temperature
            Text(
              "${data!.main!.temp}°C",
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            //icone
            const Icon(
              WeatherIcons.cloud,
              size: 20,
              color: Colors.white,
            ),
            //description
            const Text(
              "Clear",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
