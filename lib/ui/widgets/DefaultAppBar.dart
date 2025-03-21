import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(100);

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
