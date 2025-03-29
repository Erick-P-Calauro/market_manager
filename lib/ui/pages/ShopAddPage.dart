import 'package:flutter/material.dart';
import 'package:market_manager/ui/widgets/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/Header.dart';

class ShopAddPage extends StatelessWidget {
  const ShopAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;

    return DefaultScaffold(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          spacing: 40,
          children: [
            Header(text: "Cadastro de Lista de Compras"),
            Form(
              child: Column(
                spacing: 25,
                children: [
                  DefaultFormField(
                      controller: null,
                      labelText: "Descrição da Compra",
                      hintText: "Escreva uma descrição breve",
                      maxWidth: contextWidth),
                  DefaultFormField(
                      controller: null,
                      labelText: "Data da Compra",
                      hintText: "20/02/2005",
                      maxWidth: contextWidth),
                  DefaultButtonRow(
                    onConfirm: () => {print("Confirmou")},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
