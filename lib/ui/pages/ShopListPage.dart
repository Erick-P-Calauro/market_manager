import 'package:flutter/material.dart';
import 'package:market_manager/ui/model/ShopListModel.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/ShopCard.dart';
import 'package:market_manager/ui/widgets/ShopCardList.dart';
import 'package:provider/provider.dart';

class ShopListPage extends StatelessWidget {
  const ShopListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        child: ChangeNotifierProvider(
            create: (context) => ShopListModel(),
            child: ShopCardList(
              children: [
                ShopCard(Id: "0", name: "Card01", total: 1250.00),
                ShopCard(Id: "1", name: "Card02", total: 3500.10),
                ShopCard(Id: "2", name: "Card03", total: 980.25),
                ShopCard(Id: "3", name: "Card04", total: 320)
              ],
            )));
  }
}
