import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/ShopDetailedViewModel.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/Header.dart';
import 'package:market_manager/utils/Typograph.dart';

class ShopDetailedPage extends StatelessWidget {
  ShopDetailedPage({super.key, required this.viewModel});

  final ShopDetailedViewModel viewModel;
  final ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      controller: scroll,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderPlus(text: viewModel.shop?.name ?? "Lista de Compras" , newPage: RouteGenerator.AddItemPage),
                SizedBox(height: 40),
                Text("Itens", style: Typograph.HeadlineSmall),
                SizedBox(height: 40),
                Text("Carrinho", style: Typograph.HeadlineSmall),
              ],
            );
          }
        ),
      )
    );
  }
}