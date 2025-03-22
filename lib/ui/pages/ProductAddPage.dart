import 'package:flutter/material.dart';
import 'package:market_manager/ui/widgets/DefaultAppBar.dart';
import 'package:market_manager/ui/widgets/DefaultDrawer.dart';
import 'package:market_manager/ui/widgets/FormField.dart';
import '../widgets/Header.dart';

class ProductAddPage extends StatelessWidget {
  const ProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: DefaultAppBar(),
      drawer: DefaultDrawer(),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          spacing: 40,
          children: [
            Header(text: "Cadastro de Produtos"),
            Form(
                child: Column(
              spacing: 25,
              children: [
                DefaultFormField(
                  labelText: "Nome do Produto",
                  hintText: "Digite o nome do Produto",
                  maxWidth: contextWidth,
                ),
                Row(
                  children: [
                    DefaultFormField(
                        labelText: "Quantidade",
                        hintText: "Digite a quantidade",
                        maxWidth: (contextWidth - 70) / 2),
                    SizedBox(width: 30),
                    DefaultFormField(
                        labelText: "Unidade",
                        hintText: "KG",
                        maxWidth: (contextWidth - 70) / 2),
                  ],
                ),
                Row(
                  children: [
                    DefaultFormField(
                        labelText: "Preço (R\$)",
                        hintText: "Insira o Preço",
                        maxWidth: (contextWidth - 70) / 2),
                    SizedBox(width: 30),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
