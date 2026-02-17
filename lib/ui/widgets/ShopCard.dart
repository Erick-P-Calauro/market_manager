import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/ShopListModel.dart';
import 'package:market_manager/ui/widgets/RouteArguments/ShopDetailedArguments.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';
import 'package:provider/provider.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key,
    required this.id,
    required this.name,
    required this.total,
  });

  final String id;
  final String name;
  final double total;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ShopListModel>();
    final activeId = state.getId();

    return activeId == id ? OpenShopCard(id: id, name: name, total: total) : CloseShopCard(id: id, name: name, total: total);
  }
}

class CloseShopCard extends StatelessWidget {
  const CloseShopCard({
    super.key,
    required this.id,
    required this.name,
    required this.total,
  });
  
  final String id;
  final String name;
  final double total;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ShopListModel>();

    return GestureDetector(
      onTap: () => {
        state.changeId(id)
      },
      child: Padding(
        padding: EdgeInsets.only(top: 25),
        child: Container(
            decoration: BoxDecoration(
                color: CustomColors.LightGray1,
                borderRadius: BorderRadius.circular(2)),
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("DEZEMBRO / $name", style: Typograph.TitleSmall),
                    SizedBox(width: 20),
                    Text("Total : R\$ ${total.toStringAsFixed(2)}",
                        style: Typograph.BodyLarge),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_left,
                  size: 24,
                  color: Colors.black,
                ),
              ],
            )),
      ),
    );
  }
}

class OpenShopCard extends StatelessWidget {
  const OpenShopCard({
    super.key,
    required this.id,
    required this.name,
    required this.total,
  });

  final String id;
  final String name;
  final double total;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ShopListModel>();

    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Card(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => {
                state.changeId(null)
              },
              child: Container(
                decoration: BoxDecoration(
                    color: CustomColors.LightGray1,
                    borderRadius: BorderRadius.circular(2)),
                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("DEZEMBRO / $name", style: Typograph.TitleSmall),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: Colors.black,
                    ),
                  ],
                )
              ),
            ),
            Container(
              color: CustomColors.LightGray2,
              padding: EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  // SliverList(delegate: Delegate),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total : R\$ ${total.toStringAsFixed(2)}",
                          style: Typograph.SubtitleLarge,
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(context, RouteGenerator.DetailShopPage, arguments: ShopDetailedArguments(shopId: id))
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                                color: CustomColors.BlueMarket,
                                borderRadius: BorderRadius.circular(2)),
                            child: Text("Mais Detalhes",
                                style: Typograph.SubtitleLarge.copyWith(
                                    color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
