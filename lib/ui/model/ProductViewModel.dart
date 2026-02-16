import 'package:flutter/material.dart';
import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/model/Product.dart';
import 'package:market_manager/data/repository/CategoryRepository.dart';
import 'package:market_manager/data/repository/ProductRepository.dart';
class ProductViewModel extends ChangeNotifier {
  ProductViewModel(
    this._productRepository,
    this._categoryRepository
  ){
    _load();
  }

  final ProductRepository _productRepository;
  final CategoryRepository _categoryRepository;
  
  List<List<Product>> _products = [];
  List<Category> _categories = [];

  void _load() async {
    _categories = await _categoryRepository.listarCategoriasComProdutos();

    for(Category cat in _categories) {
      List<Product> catProducts = await _productRepository.listarPorCategoria(cat.id);
      _products.add(catProducts);
    }

    notifyListeners();
  }

  List<List<Product>> get products => _products;
  List<Category> get categories => _categories;
}
