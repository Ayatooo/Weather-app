import 'package:app/widgets/background.dart';
import 'package:app/widgets/city.dart';
import 'package:app/widgets/nextDay.dart';
import 'package:app/widgets/todayWeatherBoard.dart';
import 'package:flutter/material.dart';
import 'db/DatabaseHandler.dart';
import 'db/city.dart';
import 'models/todayWeather.dart';
import 'api/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Weather app'),
      debugShowCheckedModeBanner: false,
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
  late DatabaseHandler handler;

  Future<int> addCity() async {
    City firstCity = City(name: "Paris");
    City secondCity = City(name: "London");
    City th = City(name: "London");
    List<City> listOfCities = [firstCity, secondCity, th];
    return await handler.insertCity(listOfCities);
  }

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    addCity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //print the first city from the database
      body: FutureBuilder<List<City>>(
        future: handler.getCities(),
        builder: (BuildContext context, AsyncSnapshot<List<City>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(snapshot.data![index].name);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
