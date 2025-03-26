import 'package:flutter/material.dart';
import 'package:market_manager/ui/widgets/ButtonDropdownField.dart';
import 'package:market_manager/ui/widgets/DefaultAppBar.dart';
import 'package:market_manager/ui/widgets/DefaultCheckboxField.dart';
import 'package:market_manager/ui/widgets/DefaultDrawer.dart';
import 'package:market_manager/ui/widgets/DefaultDropdownField.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';
import '../widgets/Header.dart';

class ProductAddPage extends StatelessWidget {
  const ProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    // contextWidth = width do dispositivo
    // dentro do container usar contextwidth - 40 por conta das padding
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
                    DefaultDropdownField(
                        labelText: "Unidade",
                        hintText: "(KG)",
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
                    DefaultCheckboxField(
                      labelText: "Incluir no Carrinho ?",
                      onChecked: () => {print("Checou")},
                      width: (contextWidth - 70) / 2,
                    )
                  ],
                ),
                ButtonDropdownField(
                  labelText: "Categoria",
                  hintText: "Escolha a categoria do produto",
                  width: contextWidth - 94,
                  onTap: () => {print("Nova Categoria")},
                  icon: Icons.add_box,
                ),
                ButtonDropdownField(
                  labelText: "Código de Barras",
                  hintText: "Insira ou escaneie o código de barras",
                  width: contextWidth - 94,
                  onTap: () => {print("Escaneando...")},
                  icon: Icons.camera_alt,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => {Navigator.of(context).pop()},
                          child: Container(
                            decoration: BoxDecoration(
                                color: CustomColors.RedCancel,
                                borderRadius: BorderRadius.circular(2)),
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 50),
                            child: Text("Cancelar",
                                style: Typograph.TitleLarge.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400)),
                          )),
                      GestureDetector(
                          onTap: () => {print("Confirmou")},
                          child: Container(
                            decoration: BoxDecoration(
                                color: CustomColors.BlueMarket,
                                borderRadius: BorderRadius.circular(2)),
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 50),
                            child: Text("Confirmar",
                                style: Typograph.TitleLarge.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400)),
                          )),
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
