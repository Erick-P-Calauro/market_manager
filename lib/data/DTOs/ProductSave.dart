import 'package:market_manager/data/model/Category.dart';

class ProductSave {
  const ProductSave(
    this.name,
    this.category,
    this.barcode
  );

  final String name;
  final Category category;
  final String barcode;

  Map<String, Object?> toMap() {
    return { "name": name, "barcode": barcode, "category": category.id };
  }
}