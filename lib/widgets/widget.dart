import 'dart:ffi';

import 'package:app/api/api.dart';
import 'package:app/models/weekWeather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
import '../models/todayWeather.dart';
import '../utils/setBackground.dart';

BoxDecoration background() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(setbackground("Clear")),
      fit: BoxFit.cover,
    ),
  );
}

Padding city(TodayWeatherData? data) {
  return Padding(
    padding: const EdgeInsets.only(top: 60, bottom: 20),
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

SizedBox todayWeatherBoard(TodayWeatherData? data) {
  String day = DateFormat('EEEE').format(DateTime.now());
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String time = DateFormat('HH:mm').format(DateTime.now().toUtc());

  return SizedBox(
    width: 300,
    height: 150,
    child: Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(38, 38, 38, 0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                day,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                date,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                time,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 120,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Icon(
                              WeatherIcons.cloud,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          )),
    ),
  );
}

SizedBox nextDay(TodayWeatherData? data, int nextDay) {
  String day =
      DateFormat('EEEE').format(DateTime.now().add(Duration(days: nextDay)));
  String date = DateFormat('d MMM yyyy')
      .format(DateTime.now().add(Duration(days: nextDay)));

  return SizedBox(
    width: 300,
    height: 150,
    child: Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(38, 38, 38, 0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                day + ", " + date,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              getNewData(data!.coord!.lat, data.coord!.lon, nextDay),
            ],
          )),
    ),
  );
}

getNewData(double? lat, double? lon, int nextDay) {
  return FutureBuilder<WeekWeatherData>(
    future: fetchWeatherWeek(lat!, lon!),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(
          snapshot.data!.daily![nextDay].temp!.day.toString(),
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Courrier',
          ),
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return const CircularProgressIndicator();
    },
  );
}
