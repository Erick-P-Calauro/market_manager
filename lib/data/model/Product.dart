import 'package:market_manager/data/model/Category.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.category,
    this.barcode,
  });

  Product.flex(
    this.id,
    this.name,
    this.category,
    this.barcode
  );

  Product.cadastro(
    this.name,
    this.category,
    this.barcode
  );

  int? id;
  final String name;
  final String? barcode;
  final Category category;
  // final XFile? photo;

  Map<String, Object?> toMap() {
    return { "name": name, "barcode": barcode, "category": category.id };
  }
}
