import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';

import '../widgets/Header.dart';

class UnityListPage extends StatelessWidget {
  const UnityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final contextWidth = MediaQuery.of(context).size.width;

    return DefaultScaffold(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          spacing: 40,
          children: [
            HeaderPlus(
              text: "Unidades de Medida",
              newPage: RouteGenerator.NewUnityPage,
            ),
          ],
        ),
      ),
    );
  }
}
