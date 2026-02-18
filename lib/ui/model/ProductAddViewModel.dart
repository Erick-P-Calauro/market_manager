import 'package:flutter/material.dart';
import 'package:market_manager/data/DTOs/ProductSave.dart';
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

  // Categoria para cadastro e edição de produtos
  Product?  produtoEscolhido;

  void _load() async {
    _products = await _productRepository.listar();
    _categories = await _categoryRepository.listar();
    
    notifyListeners();
  }

  void definirProduto(int id) async {
    produtoEscolhido = await _productRepository.buscar(id);

    notifyListeners();
  }

  List<Product> get products => _products;
  List<Category> get categories => _categories;
  Product? get procut => produtoEscolhido;

  Future<bool> cadastrarProduto(String categoryName, String name, String barcode) async {

    if(categoryName.isEmpty || categoryName == "") {
      return false;
    }

    Category? categoria = await _categoryRepository.buscarPorNome(categoryName);
    _productRepository.cadastrar(ProductSave(name, categoria!, barcode));

    return true;
  }

  Future<bool> editarProduto(int id, String categoryName, String name, String barcode) async {

    if(categoryName.isEmpty || categoryName == "") {
      return false;
    }

    Category? categoria = await _categoryRepository.buscarPorNome(categoryName);
    _productRepository.editar(id, ProductSave(name, categoria!, barcode));

    return true;
  }
}