import 'package:flutter/material.dart';
import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/model/Product.dart';
import 'package:market_manager/data/repository/ProductRepository.dart';
import 'package:market_manager/data/services/CategoryService.dart';

class ProductViewModel extends ChangeNotifier {
  ProductViewModel(
    this._productRepository,
    this._categoryService
  ){
    _load();
  }

  final ProductRepository _productRepository;
  final CategoryService _categoryService;
  
  List<List<Product>> _products = [];
  List<Category> _categories = [];

  void _load() async {
    _categories = await _categoryService.listarCategoriasComProdutos();

    for(Category cat in _categories) {
      List<Product> cat_products = await _productRepository.listarPorCategoria(cat.id);
      _products.add(cat_products);
    }

    notifyListeners();
  }

  List<List<Product>> get products => _products;
  List<Category> get categories => _categories;
}
