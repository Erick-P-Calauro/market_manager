import 'package:market_manager/data/model/Shop.dart';
import 'package:market_manager/data/services/DatabaseService.dart';
import 'package:sqflite/sqflite.dart';

class ShopRepository {
  const ShopRepository(this._databaseService);
  
  final DatabaseService _databaseService;
  final table = "shop";

  void cadastrar(Shop shop) async {
    final db = await _databaseService.getConnection();
    
    db.insert(table, shop.toMap(), conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<List<Shop>> listar() async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> shopMaps = await db.query(table);
    List<Shop> shopList = [];

    for(final {
      'id': id as int,
      'name': name as String,
      'date': date as int,
    }in shopMaps) {
      shopList.add(Shop.detailed(id, name, DateTime.fromMicrosecondsSinceEpoch(date), 0, []));
    }

    return shopList;
  }

  Future<Shop?> buscar(int id) async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> map = await db.query(table, where: "id = $id");
    Shop? shop;

    for(final {
      'id': id as int,
      'name': name as String,
      'date': date as int
    }in map) {
      shop = Shop(id: id, name: name, date: DateTime.fromMicrosecondsSinceEpoch(date));
    }

    return shop;
  }

  void editar(int id, Shop shop) async {
    final db = await _databaseService.getConnection();

    db.update(table, shop.toMap(), conflictAlgorithm: ConflictAlgorithm.abort, where: "id = $id");
  }

  void deletar(int id) async {
    final db = await _databaseService.getConnection();

    db.delete(table, where: "id = $id");
  }

}