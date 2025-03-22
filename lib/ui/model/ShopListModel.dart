import 'package:flutter/material.dart';

class ShopListModel extends ChangeNotifier {
  String? activeId;

  void changeId(String? Id) {
    this.activeId = Id;

    notifyListeners();
  }

  String? getId() {
    return activeId;
  }
}
