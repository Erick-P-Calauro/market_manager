import 'package:market_manager/data/model/Item.dart';

class Shop {
  Shop({
    required this.id,
    required this.name,
    required this.date,
  });

  Shop.cadastro(
    this.name,
    this.date
  );

  Shop.detailed(
    this.id,
    this.name,
    this.date,
    this.total,
    this.items
  );

  int? id;
  final String name;
  final DateTime date;
  double? total;
  List<Item>? items;

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date.microsecondsSinceEpoch
    };
  }
}
