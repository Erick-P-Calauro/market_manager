import 'package:flutter/material.dart';
import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/repository/CategoryRepository.dart';

class CategoryListViewModel extends ChangeNotifier {
  CategoryListViewModel({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository {
    _load();
  }

  final CategoryRepository _categoryRepository;
  List<Category> _categories = [];

  void _load() async {
    _categories = await _categoryRepository.listar();

    notifyListeners();
  }

  void deletarCategoria(int id) async {
    _categoryRepository.deletar(id);
    _load();
  }

  List<Category> get categories => _categories;
}