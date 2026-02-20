import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:market_manager/ui/widgets/DefaultAppBar.dart';
import 'package:market_manager/ui/widgets/DefaultDrawer.dart';
import 'package:market_manager/utils/CustomColors.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    required this.child,
    required this.controller
  });

  final Widget child;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      drawer: DefaultDrawer(),
      body: SafeArea(
        child: FooterView(
          footer: Footer(
            backgroundColor: CustomColors.BlueMarket,
            padding: EdgeInsets.all(0),
            child: SizedBox(),
          ),
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 10),
              child: SingleChildScrollView(
                controller: controller ,
                child: child
              ),
            ),
          ]
        ),
      ),
    );
  }
}
