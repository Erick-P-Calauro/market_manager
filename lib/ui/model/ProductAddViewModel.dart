import 'package:flutter/material.dart';
import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/model/Product.dart';
import 'package:market_manager/data/repository/CategoryRepository.dart';
import 'package:market_manager/data/repository/ProductRepository.dart';

class ProductAddViewModel extends ChangeNotifier {
  ProductAddViewModel(
    this._productRepository,
    this._categoryRepository,
  ){
    _load();
  }

  final ProductRepository _productRepository;
  final CategoryRepository _categoryRepository;

  List<Product> _products = [];
  List<Category> _categories = [];

  void _load() async {
    _products = await _productRepository.listar();
    _categories = await _categoryRepository.listar();
    
    notifyListeners();
  }

  void cadastrarProduto(String categoryName, String name, String barcode) async {

    if(categoryName.isEmpty || categoryName == "") {
      return;
    }

    Category? categoria = await _categoryRepository.buscarPorNome(categoryName);
    _productRepository.cadastrar(Product.cadastro(name, categoria!, barcode));

    notifyListeners();
  }

  void carregarCategorias() async {
    _categories = await _categoryRepository.listar();

    notifyListeners();
  }

  List<Product> get products => _products;
  List<Category> get categories => _categories;
}