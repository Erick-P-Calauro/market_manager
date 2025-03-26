import 'package:flutter/material.dart';
import 'package:market_manager/ui/model/ShopListModel.dart';
import 'package:market_manager/ui/widgets/DefaultAppBar.dart';
import 'package:market_manager/ui/widgets/DefaultDrawer.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/ShopCardList.dart';
import 'package:provider/provider.dart';

class ShopListPage extends StatelessWidget {
  const ShopListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        child: ChangeNotifierProvider(
            create: (context) => ShopListModel(), child: ShopCardList()));
  }
}
