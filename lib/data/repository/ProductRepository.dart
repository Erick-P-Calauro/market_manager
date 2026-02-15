import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/model/Product.dart';
import 'package:market_manager/data/repository/CategoryRepository.dart';
import 'package:market_manager/data/services/DatabaseService.dart';
import 'package:sqflite/sqflite.dart';

class ProductRepository {
  ProductRepository(
    this._databaseService, 
    this._categoryRepository, );

  final DatabaseService _databaseService;
  final CategoryRepository _categoryRepository;
  final String table = "product";

  void cadastrar(Product product) async {
    final db = await _databaseService.getConnection();

    await db.insert(table, product.toMap(), conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<List<Product>> listar() async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> maps = await db.query(table);
    List<Product> products = [];
    
    for(final {
      "id": id as int,
      "name": name as String,
      "barcode": barcode as String,
      "category": category_id as int,
    } in maps) {

      Category? category = await _categoryRepository.buscar(category_id);

      products.add(Product(id: id, name: name, barcode: barcode, category: category!));
    }

    return products;
  }

  Future<List<Product>> listarPorCategoria(int id) async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> maps = await db.query(table, where: "category = $id");
    List<Product> products = [];
    
    for(final {
      "id": id as int,
      "name": name as String,
      "barcode": barcode as String,
      "category": category_id as int,
    } in maps) {

      Category? category = await _categoryRepository.buscar(category_id);

      products.add(Product(id: id, name: name, barcode: barcode, category: category!));
    }

    return products;
  }

  Future<Product?> buscar(int id) async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> maps = await db.query(table, where: "id = $id");
    Product? product;

    for(final {
      "id": id as int,
      "name": name as String,
      "barcode": barcode as String,
      "category": category_id as int,
    } in maps) {

      Category? category = await _categoryRepository.buscar(category_id);

      product = Product(id: id, name: name, barcode: barcode, category: category!);
    }

    return product;
  }

  Future<void> editar(int id, Product product) async {
    final db = await _databaseService.getConnection();

    Product nProduct = Product.flex(id, product.name, product.category, product.barcode);
    
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
