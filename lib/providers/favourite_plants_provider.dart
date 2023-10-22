import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:ui_challenge_heyflutter/model/plant.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(
      dbPath,
      'plants.db',
    ),
    onCreate: (db, version) => db.execute(
        'CREATE TABLE favourite_plants(id TEXT PRIMARY KEY, name TEXT, height TEXT, temp TEXT, price REAL, pot TEXT, image TEXT)'),
    version: 1,
  );
  return db;
}

class FavouritePlantsNotifier extends StateNotifier<List<Plant>> {
  FavouritePlantsNotifier() : super(const []);

  Future<void> loadPlants() async {
    final db = await _getDatabase();
    final data = await db.rawQuery("SELECT * FROM favourite_plants");
    final plants = data
        .map((row) => Plant(
            id: row["id"] as String,
            name: row["name"] as String,
            height: row["height"] as String,
            temperature: row["temp"] as String,
            price: row["price"] as double,
            pot: row["pot"] as String,
            image: row["image"] as String))
        .toList();

    state = plants;
  }

  Future<void> plantFavouriteStatus(Plant plant) async {
    final db = await _getDatabase();

    final isPlantFavourite = state.contains(plant);

    if (isPlantFavourite) {
      db.rawDelete("DELETE FROM favourite_plants WHERE id = ${plant.id}");
      state = [...state.where((element) => element.id != plant.id).toList()];
    } else {
      db.insert("favourite_plants", {
        "id": plant.id,
        "name": plant.name,
        "height": plant.height,
        "temp": plant.temperature,
        "price": plant.price,
        "pot": plant.pot,
        "image": plant.image,
      });
      state = [plant, ...state];
    }
  }

  List<Plant> get data {
    return state;
  }
}

final favouritePlantProvider =
    StateNotifierProvider<FavouritePlantsNotifier, List<Plant>>(
  (ref) => FavouritePlantsNotifier(),
);
