import 'package:flutter/material.dart';
import 'package:market_manager/ui/pages/ShopListPage.dart';

void main() {
  runApp(const MarketManager());
}

class MarketManager extends StatelessWidget {
  const MarketManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ShopListPage());
  }
}
