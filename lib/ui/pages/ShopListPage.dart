import 'package:flutter/material.dart';
import 'package:market_manager/ui/model/ShopListModel.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/ShopCard.dart';
import 'package:market_manager/utils/Typograph.dart';
import 'package:provider/provider.dart';

class ShopListPage extends StatelessWidget {
  ShopListPage({super.key, required this.viewModel});

  final ShopListModel viewModel;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      controller: scrollController,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text("Lista de Lista de Compras", style: Typograph.HeadlineLarge)
            ),
            ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {       
                return ChangeNotifierProvider(
                  create: (context) => viewModel,
                  child: ListView.builder(
                    shrinkWrap: true, 
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.shopList.length,
                    itemBuilder: (BuildContext context, index) {
                      final shopDetailed = viewModel.shopList[index];
                          
                      return ShopCard(shop: shopDetailed);
                    },
                  ),
                );
              }
            ),
          ],
        )
      ),
    );
  }
}
