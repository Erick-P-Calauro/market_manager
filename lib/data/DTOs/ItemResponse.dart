import 'package:market_manager/data/DTOs/ProductItem.dart';
import 'package:market_manager/data/model/MeasureUnity.dart';

class ItemResponse {
  const ItemResponse(
    this.id,
    this.product,
    this.unity,
    this.price,
    this.quantity,
  );

  final int id;
  final ProductItem product;
  final MeasureUnity unity;
  final double price;
  final int quantity;
}