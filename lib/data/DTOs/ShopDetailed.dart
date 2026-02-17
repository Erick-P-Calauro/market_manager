import 'package:market_manager/data/DTOs/ItemResponse.dart';

class ShopDetailed {
  const ShopDetailed(
    this.id,
    this.name,
    this.date,
    this.total,
    this.items
  );

  final int id;
  final String name;
  final DateTime date;
  final double total;
  final List<ItemResponse>? items;
}