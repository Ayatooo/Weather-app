// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const

import 'dart:convert';
import 'package:app/widgets/widget.dart';
import 'package:flutter/material.dart';
import './models/weather.dart';
import 'api/api.dart';
import 'package:app/utils/setBackground.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'utils/setBackground.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Weather app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Le background est défini dans le fichier setBackground.dart
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(setbackground("Clear")),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FutureBuilder<WeatherData>(
            future: fetchWeatherData('Paris'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    city(cityName: snapshot.data!.name.toString()),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueAccent,
                      ),
                      child: SizedBox(
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
                                  "${snapshot.data!.main!.temp}°C",
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
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
