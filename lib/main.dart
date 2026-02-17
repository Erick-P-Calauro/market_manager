import 'package:flutter/material.dart';
import 'package:market_manager/data/repository/CategoryRepository.dart';
import 'package:market_manager/data/repository/MeasureUnityRepository.dart';
import 'package:market_manager/data/repository/ProductRepository.dart';
import 'package:market_manager/data/repository/ShopRepository.dart';
import 'package:market_manager/data/services/DatabaseService.dart';
import 'package:market_manager/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MarketManager());
}

class MarketManager extends StatelessWidget {
  const MarketManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => DatabaseService()),
        Provider(create: (context) => CategoryRepository(context.read())),
        Provider(create: (context) => MeasureUnityRepository(databaseService: context.read())),
        Provider(create: (context) => ProductRepository(context.read())),
        Provider(create: (context) => ShopRepository(context.read()))
      ], 
      child: MaterialApp(
        onGenerateTitle: (context) => "Market Manager",
        debugShowCheckedModeBanner: false,
        initialRoute: RouteGenerator.InitialPage,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
