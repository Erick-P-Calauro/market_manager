import 'package:flutter/material.dart';
import 'package:market_manager/ui/widgets/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/Header.dart';

class CategoryAddPage extends StatelessWidget {
  const CategoryAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;

    return DefaultScaffold(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          spacing: 40,
          children: [
            Header(text: "Cadastro de categorias"),
            Form(
              child: Column(
                spacing: 25,
                children: [
                  DefaultFormField(
                      labelText: "Nome da categoria",
                      hintText: "Escreva o nome da categoria",
                      maxWidth: contextWidth),
                  DefaultButtonRow()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
