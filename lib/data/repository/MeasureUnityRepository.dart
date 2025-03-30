import 'package:market_manager/data/model/MeasureUnity.dart';
import 'package:market_manager/data/services/DatabaseService.dart';
import 'package:sqflite/sqflite.dart';

class MeasureUnityRepository {
  MeasureUnityRepository({required DatabaseService databaseService})
      : _databaseService = databaseService;

  final DatabaseService _databaseService;

  void cadastrar(MeasureUnity unity) async {
    final db = await _databaseService.getConnection();

    db.insert("unity", unity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<List<MeasureUnity>> listar() async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> maps = await db.query("unity");
    List<MeasureUnity> unities = [];

    for (final {
          "id": id as int,
          "name": name as String,
          "abbreviation": abbreviation as String
        } in maps) {
      unities.add(MeasureUnity(id: id, name: name, abbreviation: abbreviation));
    }

    return unities;
  }
}
