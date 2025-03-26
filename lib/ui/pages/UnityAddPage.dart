import 'package:flutter/material.dart';
import 'package:market_manager/ui/widgets/DefaultAppBar.dart';
import 'package:market_manager/ui/widgets/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/DefaultDrawer.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/Header.dart';

class UnityAddPage extends StatelessWidget {
  const UnityAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: DefaultAppBar(),
      drawer: DefaultDrawer(),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          spacing: 40,
          children: [
            Header(text: "Cadastro de Unidades de Medida"),
            Form(
              child: Column(
                spacing: 25,
                children: [
                  DefaultFormField(
                      labelText: "Nome da Unidade de Medida",
                      hintText: "Escreva o nome inteiro da unidade de medida",
                      maxWidth: contextWidth),
                  DefaultFormField(
                      labelText: "Abreviação da unidade de medida",
                      hintText: "Escreva a abreviação da unidade (Ex: 'KG')",
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
