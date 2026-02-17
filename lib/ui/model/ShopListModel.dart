import 'package:flutter/material.dart';
import 'package:market_manager/data/DTOs/ShopDetailed.dart';
import 'package:market_manager/data/repository/ShopRepository.dart';

class ShopListModel extends ChangeNotifier {
  ShopListModel(this._shopRepository){
    _load();
  }

  final ShopRepository _shopRepository;
  List<ShopDetailed> _shopList = [];

  // Shop load Logic
  void _load() async {
    _shopList = await _shopRepository.listar();
    notifyListeners();
  }

  List<ShopDetailed> get shopList => _shopList;

  // ShopCard Manipulation Logic
  int? activeId;

  void changeId(int? id) {
    activeId = id;

    notifyListeners();
  }

  int? getId() {
    return activeId;
  }
}
