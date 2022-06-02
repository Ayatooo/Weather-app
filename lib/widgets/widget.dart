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

Padding city(WeatherData? data) {
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

SizedBox todayWeatherBoard(WeatherData? data) {
  return SizedBox(
    width: 300,
    height: 150,
    child: Container(
        decoration: BoxDecoration(
        color: const Color.fromRGBO(38, 38, 38, 0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child : Row(
      children: [
      Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: leftside(data),
          )
        ),
        
      Padding(
        padding: const EdgeInsets.only(left: 27),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: rightside(data),
            ),
      )
      ],)
    ),
  );
}

List<Widget> leftside(WeatherData? data){
return <Widget>[
    const Text(
      "day",
      style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white),
    ),
    const Text(
      "Feb 2 2022",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    ),
    const Text(
      "19:22",
      style: TextStyle(
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
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Icon(
                  getIcon(data!.weather![0].main.toString()),
                  size: 20,
                  color: Colors.orange,
                ),
              ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "${data.weather![0].main.toString()}",
                      style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  ),
                ),
            ],
          )
        ),
      ),
    ),
];
}

List<Widget> rightside(WeatherData? data){
  return <Widget>[ 
    Padding(
      padding: const EdgeInsets.only(bottom: 5, right : 10),
      child: Text(
        "${data!.main!.temp}°",
        style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white),
      ),
    ),
    Text(
      "Humidité: ${data.main!.humidity} %",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    ),
    Text(
      "Vent: ${data.wind!.speed} km/h",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    ),
  ];
}

IconData getIcon(String weather){
  switch(weather){
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