import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/todayWeather.dart';
import '../utils/utils.dart';

List<Widget> leftside(TodayWeatherData? data) {
  String day = DateFormat('EEEE').format(DateTime.now());
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String time = DateFormat('HH:mm').format(DateTime.now().toUtc());
  return <Widget>[
    Text(
      day,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    Text(
      date,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    Text(
      time,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    SizedBox(
      width: 120,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Icon(getIcon(data!.weather![0].main.toString()),
                      size: 20,
                      color: getColor(data.weather![0].main.toString())),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "${data.weather![0].main}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            )),
      ),
    ),
  ];
}
