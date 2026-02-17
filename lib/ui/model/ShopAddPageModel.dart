import 'package:flutter/material.dart';
import 'package:market_manager/data/model/Shop.dart';
import 'package:market_manager/data/repository/ShopRepository.dart';

class ShopAddPageModel extends ChangeNotifier{
  ShopAddPageModel(this._shopRepository);

  final ShopRepository _shopRepository;

  void cadastrar(Shop shop) async {
    _shopRepository.cadastrar(shop);

    notifyListeners();
  }
}