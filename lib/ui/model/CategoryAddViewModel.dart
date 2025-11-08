import 'package:flutter/material.dart';
import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/repository/CategoryRepository.dart';

class CategoryAddViewModel extends ChangeNotifier {
  CategoryAddViewModel({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository;

  final CategoryRepository _categoryRepository;
  Category? category;

  void cadastrarCategoria(String category) {
    _categoryRepository.cadastrar(category);

    notifyListeners();
  }

  void editarCategoria(String categoryText, int categoryId) {
    Category category = Category(id: categoryId, name: categoryText);
    _categoryRepository.editar(categoryId, category);

    notifyListeners();
  }

  Future<Category?> carregarCategoria(int categoryId) async {
    category = await _categoryRepository.buscar(categoryId);

    return category;
  }
}
