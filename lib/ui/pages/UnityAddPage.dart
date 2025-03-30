import 'package:flutter/material.dart';
import 'package:market_manager/data/model/MeasureUnity.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/MeasureUnityViewModel.dart';
import 'package:market_manager/ui/widgets/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/Header.dart';

class UnityAddPage extends StatelessWidget {
  const UnityAddPage({super.key, required this.viewModel});

  final MeasureUnityViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;

    final nameController = TextEditingController();
    final abbreviationController = TextEditingController();

    return DefaultScaffold(
      child: Container(
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
                      controller: nameController,
                      labelText: "Nome da Unidade de Medida",
                      hintText: "Escreva o nome inteiro da unidade de medida",
                      maxWidth: contextWidth),
                  DefaultFormField(
                      controller: abbreviationController,
                      labelText: "Abreviação da unidade de medida",
                      hintText: "Escreva a abreviação da unidade (Ex: 'KG')",
                      maxWidth: contextWidth),
                  DefaultButtonRow(
                    onConfirm: () => {
                      viewModel.cadastrar(
                        MeasureUnity(
                            id: null,
                            name: nameController.text,
                            abbreviation: abbreviationController.text),
                      ),
                      Navigator.of(context)
                          .pushNamed(RouteGenerator.ListUnityPage)
                    },
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
