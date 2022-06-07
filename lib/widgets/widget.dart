import 'package:app/api/api.dart';
import 'package:app/models/weekWeather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/todayWeather.dart';
import '../utils/utils.dart';

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

SizedBox todayWeatherBoard(TodayWeatherData? data) {
  return SizedBox(
    width: 300,
    height: 150,
    child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(38, 38, 38, 0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: leftside(data),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: rightside(data),
              ),
            )
          ],
        )),
  );
}

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
