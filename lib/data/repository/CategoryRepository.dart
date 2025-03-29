import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/services/DatabaseService.dart';
import 'package:sqflite/sqflite.dart';

class CategoryRepository {
  CategoryRepository({required DatabaseService databaseService})
      : _databaseService = databaseService;

  final DatabaseService _databaseService;

  void cadastrar(String category) async {
    final db = await _databaseService.getConnection();

    db.insert("category", <String, Object?>{"name": category},
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<List<Category>> listar() async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> maps = await db.query("category");
    List<Category> categories = [];

    // Map<String, Object?> => Category
    for (final {'id': id as int, 'name': name as String} in maps) {
      categories.add(Category(id: id, name: name));
    }

    return categories;
  }
}
