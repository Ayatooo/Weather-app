import 'package:app/db/city.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'cities.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE cities(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  //get all the cities from the database
  Future<List<City>> getCities() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('cities');
    return List.generate(maps.length, (i) {
      return City.fromMap(maps[i]);
    });
  }

  Future<void> deleteCity(String name) async {
    final db = await initializeDB();
    await db.delete(
      'cities',
      where: "name = ?",
      whereArgs: [name],
    );
  }

  Future<int> updateCity(City city) async {
    final Database db = await initializeDB();
    return await db.update('cities', city.toMap(),
        where: 'city = ?', whereArgs: [city.name]);
  }

  //add one city to database
  Future<int> addCity(City city) async {
    final Database db = await initializeDB();
    return await db.insert('cities', city.toMap());
  }

  //delete all the cities from the database
  Future<void> deleteAllCities() async {
    final Database db = await initializeDB();
    await db.delete('cities');
  }

  //get the id of the city name
  Future<int> getCityId(String cityName) async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps =
        await db.query('cities', where: 'name = ?', whereArgs: [cityName]);
    return maps[0]['id'];
  }

  //clear all the cities from the database
  Future<void> clearDatabase() async {
    final Database db = await initializeDB();
    await db.rawDelete('DELETE FROM cities');
  }
}
