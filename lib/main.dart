import 'package:app/widgets/widget.dart';
import 'package:flutter/material.dart';
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
      title: 'Paris',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Paris'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavDrawer(),
      appBar: AppBar(
        title : Text(widget.title, textAlign: TextAlign.center,),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: background(),
        child: Center(
          child: FutureBuilder<TodayWeatherData>(
            future: fetchWeatherToday('Paris'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 130)),
                    todayWeatherBoard(snapshot.data),
                    const Padding(padding: EdgeInsets.only(top: 50)),
                    nextday(snapshot.data, 1),
                    nextday(snapshot.data, 2),
                    nextday(snapshot.data, 3),
                    nextday(snapshot.data, 4),
                    nextday(snapshot.data, 5),
                  ],
                );
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
