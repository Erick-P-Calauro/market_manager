import 'package:flutter/material.dart';
import 'package:market_manager/ui/pages/CategoryAddPage.dart';
import 'package:market_manager/ui/pages/CategoryListPage.dart';
import 'package:market_manager/ui/pages/ProductAddPage.dart';
import 'package:market_manager/ui/pages/ProductListPage.dart';
import 'package:market_manager/ui/pages/SettingsPage.dart';
import 'package:market_manager/ui/pages/ShopAddPage.dart';
import 'package:market_manager/ui/pages/ShopListPage.dart';
import 'package:market_manager/ui/pages/UnityAddPage.dart';
import 'package:market_manager/ui/pages/UnityListPage.dart';

class RouteGenerator {
  static const String InitialPage = "/";

  // List Pages
  static const String ListShopPage = InitialPage;
  static const String ListProductPage = "/product";
  static const String ListCategoryPage = "/category";
  static const String ListUnityPage = "/unity";

  // Add Pages
  static const String NewShopPage = "/shop/new";
  static const String NewProductPage = "/product/new";
  static const String NewCategoryPage = "/category/new";
  static const String NewUnityPage = "/unity/new";

  // Special Pages
  static const String AddProductShopPage = "/shop/add";
  static const String Settings = "/settings";

  RouteGenerator();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case InitialPage:
        return MaterialPageRoute(builder: (context) => const ShopListPage());
      case ListProductPage:
        return MaterialPageRoute(builder: (context) => ProductListPage());
      case ListCategoryPage:
        return MaterialPageRoute(builder: (context) => CategoryListPage());
      case ListUnityPage:
        return MaterialPageRoute(builder: (context) => UnityListPage());
      case NewProductPage:
        return MaterialPageRoute(builder: (context) => ProductAddPage());
      case NewShopPage:
        return MaterialPageRoute(builder: (context) => ShopAddPage());
      case NewCategoryPage:
        return MaterialPageRoute(builder: (context) => CategoryAddPage());
      case NewUnityPage:
        return MaterialPageRoute(builder: (context) => UnityAddPage());
      case Settings:
        return MaterialPageRoute(builder: (context) => SettingsPage());
      default:
        throw FormatException("Route exception");
    }
  }
}
