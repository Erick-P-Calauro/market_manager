import 'package:market_manager/data/model/MeasureUnity.dart';
import 'package:market_manager/data/model/Product.dart';
import 'package:market_manager/data/model/Shop.dart';

class Item {
  Item(
    {
    required this.id,
    required this.shop,
    required this.product,
    required this.quantity,
    required this.price,
    required this.unity,
    required this.onCart
    }
  );

  final int id;
  final Shop shop;
  final Product product;
  final MeasureUnity unity;
  final double price;
  final int quantity;
  final bool onCart;
}
