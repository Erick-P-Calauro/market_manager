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

  Future<Category?> buscar(int id) async {
    final db =  await _databaseService.getConnection();

    List<Map<String, Object?>> maps = await db.query("category", where: "id = $id");
    Category? category;
    
    for (final {'id': id as int, 'name': name as String} in maps) {
      category = Category(id: id, name: name);
    }

    return category;
  }

  void editar(int id, Category category) async {
    final db = await _databaseService.getConnection();

    Category newCategory = Category(id: id, name: category.name);
    db.insert("category", newCategory.toMap(), 
      conflictAlgorithm: ConflictAlgorithm.abort);
  }

  void deletar(int id) async {
    final db = await _databaseService.getConnection();

    db.delete("category", where: "id = $id");
  }
}
