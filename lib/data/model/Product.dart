import 'package:flutter/foundation.dart';
import 'package:market_manager/data/model/MeasureUnity.dart';

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    this.barcode,
    required this.unity,
    required this.category,
  });

  final int id;
  final String name;
  final double price;
  final String? barcode;
  //final XFile? photo;
  final MeasureUnity unity;
  final Category category;
}
