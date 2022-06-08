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

  Future<int> insertCity(List<City> cities) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var city in cities) {
      result = await db.insert('cities', city.toMap());
    }
    return result;
  }

  Future<List<City>> getCities() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('cities');
    return List.generate(maps.length, (i) {
      return City.fromMap(maps[i]);
    });
  }

  Future<void> deleteCity(int id) async {
    final db = await initializeDB();
    await db.delete(
      'cities',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateCity(City city) async {
    final Database db = await initializeDB();
    return await db.update('cities', city.toMap(),
        where: 'city = ?', whereArgs: [city.name]);
  }
}
