import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/repository/CategoryRepository.dart';
import 'package:market_manager/data/repository/ProductRepository.dart';

class CategoryService {
  const CategoryService(this._categoryRepository, this._productRepository);

  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  void cadastrar(String category) {
    _categoryRepository.cadastrar(category);
  }

  Future<List<Category>> listar() async {
    return await _categoryRepository.listar();
  }

  Future<List<Category>> listarCategoriasComProdutos() async {
    List<Category> categories = await _categoryRepository.listar();
    List<Category> categoriesWithProducts = [];
  
    for(Category category in categories) {
      if(await _productRepository.verificarCategoria(category.id)) {
        categoriesWithProducts.add(category);
      }
    }

    return categoriesWithProducts;
  }

  Future<Category?> buscarPorId(int categoryId) async {
    return await _categoryRepository.buscar(categoryId);
  }

  Future<Category?> buscarPorNome(String categoryName) async {
    return await _categoryRepository.buscarPorNome(categoryName);
  }

  void editar(int id, Category category) async {
    return await _categoryRepository.editar(id, category);
  }

  void deletar(int id) async {
    return await _categoryRepository.deletar(id);
  }

}