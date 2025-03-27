import 'package:flutter/material.dart';

class ShopCardList extends StatelessWidget {
  const ShopCardList({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 40 - 25, 20, 0),
        child: ListView(shrinkWrap: true, children: children));
  }
}
