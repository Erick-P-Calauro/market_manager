import 'package:market_manager/data/model/Product.dart';
import 'package:market_manager/data/model/Shop.dart';

class Item {
  const Item(
      {required this.id,
      required this.shop,
      required this.product,
      required this.quantity,
      required this.onCart});

  final int id;
  final Shop shop;
  final Product product;
  final double quantity;
  final bool onCart;
}
