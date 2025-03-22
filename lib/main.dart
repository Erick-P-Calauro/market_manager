import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';

void main() {
  runApp(const MarketManager());
}

class MarketManager extends StatelessWidget {
  const MarketManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "Market Manager",
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.InitialPage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
