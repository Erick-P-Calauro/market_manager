import 'package:flutter/material.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';

class ShopDetailedPage extends StatelessWidget {
  ShopDetailedPage({super.key, required this.shopId});

  final String shopId;
  final ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      controller: scroll,
      child: Text("ShopId : $shopId")
    );
  }
}