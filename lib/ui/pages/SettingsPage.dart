import 'package:flutter/material.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';

import '../widgets/Header.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      controller: scrollController,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Header(text: "Configurações"),
      ),
    );
  }
}
