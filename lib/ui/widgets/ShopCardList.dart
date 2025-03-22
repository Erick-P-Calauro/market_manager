import 'package:flutter/material.dart';
import 'package:market_manager/ui/model/ShopListModel.dart';
import 'package:market_manager/ui/widgets/ShopCard.dart';
import 'package:provider/provider.dart';

class ShopCardList extends StatelessWidget {
  const ShopCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 40 - 25, 20, 0),
      child: Consumer<ShopListModel>(builder: (context, model, child) {
        return ListView(
          children: [
            ShopCard(Id: "0", name: "Card01", total: 1250.00),
            ShopCard(Id: "1", name: "Card02", total: 3500.10),
            ShopCard(Id: "2", name: "Card03", total: 980.25),
            ShopCard(Id: "3", name: "Card04", total: 320)
          ],
        );
      }),
    );
  }
}
