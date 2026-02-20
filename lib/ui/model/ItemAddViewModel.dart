import 'package:flutter/material.dart';
import 'package:market_manager/data/DTOs/ItemSave.dart';
import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/model/MeasureUnity.dart';
import 'package:market_manager/data/model/Product.dart';
import 'package:market_manager/data/repository/CategoryRepository.dart';
import 'package:market_manager/data/repository/MeasureUnityRepository.dart';
import 'package:market_manager/data/repository/ProductRepository.dart';

class ItemAddViewModel extends ChangeNotifier {
  ItemAddViewModel(this._categoryRepository, this._productRepository, this._unityRepository, this.shopId){
    _load();
  }

  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;
  final MeasureUnityRepository _unityRepository;
  final int shopId;

  List<Product> _products = [];
  List<Category> _categories = [];
  List<MeasureUnity> _unities = [];

  void _load() async {
    _products = await _productRepository.listar();
    _categories = await _categoryRepository.listar();
    _unities = await _unityRepository.listar();

    notifyListeners();
  }

  void filtrarProdutos(String? categoryName) async {
    if(categoryName == null) {
      return;
    }

    Category? category = await _categoryRepository.buscarPorNome(categoryName);
    _products = await _productRepository.listarPorCategoria(category!.id);

    notifyListeners();
  }

  void cadastrarItem(ItemSave item) {

  }

  List<Product> get products => _products;
  List<Category> get categories => _categories;
  List<MeasureUnity> get unities => _unities;
}