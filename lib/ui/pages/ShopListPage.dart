import 'package:flutter/material.dart';
import 'package:market_manager/ui/model/ShopListModel.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/ShopCard.dart';
import 'package:provider/provider.dart';

class ShopListPage extends StatelessWidget {
  ShopListPage({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      controller: scrollController,
      child: ChangeNotifierProvider(
        create: (context) => ShopListModel(context.read()),
        child: Builder(
          builder: (context) {
            return Container(
              padding: EdgeInsets.fromLTRB(20, 40 - 25, 20, 0),
              child: ListenableBuilder(
                listenable: context.watch<ShopListModel>(),
                builder: (context, child) {
                  final state = context.watch<ShopListModel>();
            
                  return ListView.builder(
                    shrinkWrap: true, 
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.shopList.length,
                    itemBuilder: (context, index) {
                      final shopInfo = state.shopList[index];
            
                      return ShopCard(id: shopInfo.id!, name: shopInfo.name, total: 0);
                    },
                  );
                }
              )
            );
          }
        ),
      )
    );
  }
}
