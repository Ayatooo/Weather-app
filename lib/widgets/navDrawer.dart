import 'package:flutter/material.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:sqflite/sqflite.dart';

import '../db/city.dart';
import '../db/DatabaseHandler.dart';
import '../main.dart';

List<City> cities = [];

//cities is the list of cities that are in the database
Future<void> getCities() async {
  final Database db = await DatabaseHandler().initializeDB();
  final List<Map<String, dynamic>> maps = await db.query('cities');
  cities = List.generate(maps.length, (i) {
    return City.fromMap(maps[i]);
  });
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Center(
                  child: Column(
            children: [
              const Text(
                'Mes Villes',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () {
                    (prompt(context)).then((value) {
                      if (value != null) {
                        // Add the city to the database
                        DatabaseHandler handler = DatabaseHandler();
                        handler.addCity(City(name: value)).then((id) {
                          cities.add(City(name: value));
                        });
                      }
                    });
                  },
                  child: Text(
                    'Ajouter une ville',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  )),
            ],
          ))),
          ListView.builder(
            shrinkWrap: true,
            // padding: const EdgeInsets.all(),
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return ListTile(
                //title is the city name,
                title: Text(cities[index].name),
                onTap: () {
                  Navigator.pop(context);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
