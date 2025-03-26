import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/widgets/DefaultAppBar.dart';
import 'package:market_manager/ui/widgets/DefaultDrawer.dart';
import 'package:market_manager/ui/widgets/ListSection.dart';

import '../widgets/Header.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: DefaultAppBar(),
      drawer: DefaultDrawer(),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
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
                ListSection(
                    title: "Frutas, ovos e verduras", width: contextWidth),
                ListSection(title: "Produtos de Limpeza", width: contextWidth),
                ListSection(title: "Cereais", width: contextWidth),
              ],
            )
          ],
        ),
      ),
    );
  }
}
