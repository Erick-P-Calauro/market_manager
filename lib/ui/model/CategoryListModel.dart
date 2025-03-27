import 'package:flutter/material.dart';

class CategoryListModel extends ChangeNotifier {
  final List<String> _categories = [
    "Frutas, ovos e verduras",
    "Pães",
    "Cereais"
  ];

  List<String> getCategories() {
    return _categories;
  }
}
