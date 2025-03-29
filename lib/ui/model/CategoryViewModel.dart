import 'package:flutter/material.dart';
import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/repository/CategoryRepository.dart';

class CategoryViewModel extends ChangeNotifier {
  CategoryViewModel({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository {
    _load();
  }

  final CategoryRepository _categoryRepository;
  List<Category> _categories = [];

  void _load() async {
    _categories = await _categoryRepository.listar();

    notifyListeners();
  }

  void cadastrarCategoria(String category) {
    _categoryRepository.cadastrar(category);

    notifyListeners();
  }

  List<Category> get categories => _categories;
}
