import 'package:market_manager/data/DTOs/ProductSave.dart';
import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/model/Product.dart';
import 'package:market_manager/data/services/DatabaseService.dart';
import 'package:sqflite/sqflite.dart';

class ProductRepository {
  ProductRepository(this._databaseService);

  final DatabaseService _databaseService;
  final String table = "product";

  void cadastrar(ProductSave product) async {
    final db = await _databaseService.getConnection();

    await db.insert(table, product.toMap(), conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<List<Product>> listar() async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> maps = await db.rawQuery("SELECT product.id AS id, product.name AS name, product.barcode AS barcode, category.id AS category_id, category.name AS category_name FROM product LEFT JOIN category ON product.category = category.id");
    List<Product> products = [];
    
    for(final {
      "id": id as int,
      "name": name as String,
      "barcode": barcode as String,
      "category_id": categoryId as int,
      "category_name": categoryName as String
    } in maps) {
      products.add(Product(id, name, Category(id: categoryId, name: categoryName), barcode));
    }

    return products;
  }

  Future<List<Product>> listarPorCategoria(int id) async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> maps = await db.rawQuery("SELECT product.id AS id, product.name AS name, barcode, category.id AS category_id, category.name AS category_name FROM product INNER JOIN category ON product.category = category.id WHERE product.category = $id");
    List<Product> products = [];

    for(final {
      "id": id as int,
      "name": name as String,
      "barcode": barcode as String,
      "category_id": categoryId as int,
      "category_name": categoryName as String
    } in maps) {

      products.add(Product(id, name, Category(id: categoryId, name: categoryName), barcode));
    }

    return products;
  }

  Future<Product?> buscar(int id) async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> maps = await db.rawQuery("SELECT product.id AS id, product.name AS name, barcode, category.id AS category_id, category.name AS category_name FROM product LEFT JOIN category ON product.category = category.id WHERE product.id = $id");
    Product? product;

    for(final {
      "id": id as int,
      "name": name as String,
      "barcode": barcode as String,
      "category_id": categoryId as int,
      "category_name": categoryName as String
    } in maps) {
      product = Product(id, name, Category(id: categoryId, name: categoryName), barcode);
    }

    return product;
  }

  Future<void> editar(int id, Product product) async {
    final db = await _databaseService.getConnection();

    Product nProduct = Product(id, product.name, product.category, product.barcode);
    
    await db.update(table, nProduct.toMap(),
      conflictAlgorithm: ConflictAlgorithm.abort,
      where: 'id = $id');
  }

  Future<void> deletar(int id) async {
    final db = await _databaseService.getConnection();

    await db.delete(table, where: "id = $id");
  }

  // Retorna true se a categoria tem algum produto cadastrado.
  Future<bool> verificarCategoria(int id) async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> maps = await db.query(table, where: "category = $id", limit: 1);

    if(maps.isEmpty) {
      return false;
    }

    return true;
  }
}
