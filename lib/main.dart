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

        // Le contenu de la page
        child : Center(
          child:  Column(
              //on commence au debut de la page et au milieu
              children : [
              Padding(
                padding: EdgeInsets.only(top:40, bottom: 20),
                child : Text( "Paris", style: TextStyle(fontSize: 30, color: Colors.white),),
              ),

              //texte au dessus de la boite d'affichage
              //boite d'affichage
              Container(
              child : SizedBox(
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
                        Text(
                          "Monday",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "Feb 2 2022",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "19:22",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(
                          width: 120,
                          height: 60,
                          child : Padding(
                            padding: const EdgeInsets.only(top: 15, left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          child : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom : 10),
                              child : Icon(
                                WeatherIcons.cloud,
                                size: 20,
                              color: Colors.white,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left : 5),
                            child : Text(
                          "Clear",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                            ),
                        ],)
                          ),
                          ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueAccent,
              ),
              ),
              ]
            )
          ,)
      ),
    );
  }
}
