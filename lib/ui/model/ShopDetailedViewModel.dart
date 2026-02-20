import 'package:flutter/material.dart';
import 'package:market_manager/data/model/Shop.dart';
import 'package:market_manager/data/repository/ShopRepository.dart';

class ShopDetailedViewModel extends ChangeNotifier {
  ShopDetailedViewModel(this._shopRepository, this.shopId) {
    _load();
  }

  final ShopRepository _shopRepository;
  final int shopId;
  
  Shop? _shop;

  void _load() async {
    _shop = await _shopRepository.buscar(shopId);

    notifyListeners();
  }

  Shop? get shop => _shop;
}