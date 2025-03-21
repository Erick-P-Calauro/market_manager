import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';

class DefaultAppBar extends PreferredSize {
  const DefaultAppBar({
    super.key,
    required super.preferredSize,
    super.child = const Text(""),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: CustomColors.BlueMarket,
        toolbarHeight: 100,
        leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: Scaffold.of(context).openDrawer,
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 40,
              ),
            )));
  }
}
