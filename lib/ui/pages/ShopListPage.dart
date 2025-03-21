import 'package:flutter/material.dart';
import 'package:market_manager/ui/widgets/DefaultAppBar.dart';

class ShopListPage extends StatelessWidget {
  const ShopListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          preferredSize: Size(MediaQuery.of(context).size.width, 100)),
      drawer: Drawer(),
      body: Text(
        "Oi",
        style: TextStyle(fontSize: 50, color: Colors.amber),
      ),
    );
  }
}
