import 'package:app/widgets/setIcon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/todayWeather.dart';
import 'getNewData.dart';

Padding nextday(TodayWeatherData? data, int nextDay) {
  String day =
      DateFormat('EEEE').format(DateTime.now().add(Duration(days: nextDay)));
  String date = DateFormat('d MMM yyyy')
      .format(DateTime.now().add(Duration(days: nextDay)));
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: SizedBox(
      width: 300,
      height: 50,
      child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(202, 54, 165, 235),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "$day , $date",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const Spacer(),
              setIcon(data!.coord!.lat, data.coord!.lon, nextDay),
              const Padding(
                padding: EdgeInsets.only(left: 30),
              ),
              getNewData(data.coord!.lat, data.coord!.lon, nextDay),
            ],
          )),
    ),
  );
}
