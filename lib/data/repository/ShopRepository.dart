import 'package:market_manager/data/DTOs/ItemResponse.dart';
import 'package:market_manager/data/DTOs/ProductItem.dart';
import 'package:market_manager/data/DTOs/ShopDetailed.dart';
import 'package:market_manager/data/DTOs/ShopSave.dart';
import 'package:market_manager/data/model/MeasureUnity.dart';
import 'package:market_manager/data/model/Shop.dart';
import 'package:market_manager/data/services/DatabaseService.dart';
import 'package:sqflite/sqflite.dart';

class ShopRepository {
  const ShopRepository(this._databaseService);
  
  final DatabaseService _databaseService;
  final table = "shop";

  void cadastrar(ShopSave shop) async {
    final db = await _databaseService.getConnection();
    
    db.insert(table, shop.toMap(), conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<List<ItemResponse>> listarPorCompra(int shopId) async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> maps = await db.rawQuery(
      """
        SELECT item.id AS id, product.id as p_id, product.name AS p_name, item.quantity AS quantity, 
        item.price AS price, unity.name AS u_name, unity.abbreviation AS u_abbreviation
        FROM shop
        INNER JOIN item ON shop.id = item.shop
        INNER JOIN product ON item.product = product.id
        INNER JOIN unity ON item.unity = unity.id
        WHERE item.shop = $shopId
      """
    );

    List<ItemResponse> items = [];

    for(final {
      'id': id as int,
      'p_id': productId as int,
      'p_name': productName as String,
      'quantity': quantity as int,
      'price': price as double?,
      'u_name': unityName as String,
      'abbreviation': abbreviation as String
    } in maps) {
      items.add(ItemResponse(id, ProductItem(productId, productName), MeasureUnity(id: -1, name: unityName, abbreviation: abbreviation), price ?? 0 , quantity));
    }

    return items;
  }

  Future<List<ShopDetailed>> listar() async {
    final db = await _databaseService.getConnection();

    List<Map<String, Object?>> shopMaps = await db.rawQuery(
      """
        SELECT shop.id AS id, shop.name AS name, shop.date AS date, SUM(item.quantity * item.price) AS total
        FROM shop
        LEFT JOIN item
        ON shop.id = item.shop
        GROUP BY shop.id
      """
    );
    List<ShopDetailed> shopList = [];

    for(final {
      'id': id as int,
      'name': name as String,
      'date': date as int,
      'total': total as double?,
    }in shopMaps) {
      List<ItemResponse> shopItens = await listarPorCompra(id);

      shopList.add(ShopDetailed(id, name, DateTime.fromMicrosecondsSinceEpoch(date), total ?? 0, shopItens));
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