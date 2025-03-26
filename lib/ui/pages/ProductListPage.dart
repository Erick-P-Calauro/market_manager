import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/ListSection.dart';
import '../widgets/Header.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: Column(
          spacing: 40,
          children: [
            HeaderPlus(
              text: "Produtos",
              newPage: RouteGenerator.NewProductPage,
            ),
            Column(
              spacing: 15,
              children: [
                ListSection(title: "Frutas, ovos e verduras"),
                ListSection(title: "Produtos de Limpeza"),
                ListSection(title: "Cereais"),
                ListSection(title: "Frios")
              ],
            )
          ],
        ),
      ),
    );
  }
}
