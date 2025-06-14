// import 'package:flutter/foundation.dart';
// import 'package:market_manager/data/model/MeasureUnity.dart';

import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/model/MeasureUnity.dart';

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.unity,
    this.barcode,
  });

  final int id;
  final String name;
  final double price;
  final String? barcode;
  final Category category;
  final MeasureUnity unity;
  // final XFile? photo;

  Map<String, Object?> toMap() {
    return {"name": name, "price": price, "barcode": barcode};
  }
}
