import 'package:flutter/material.dart';
import 'package:market_manager/data/DTOs/ShopSave.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/ShopAddPageModel.dart';
import 'package:market_manager/ui/widgets/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/Header.dart';

class ShopAddPage extends StatelessWidget {
  ShopAddPage({super.key, required this.viewModel});

  final ShopAddPageModel viewModel;
  final ScrollController scrollController = ScrollController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  void limparCampos() {
    nameController.text = "";
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;

    return DefaultScaffold(
      controller: scrollController,
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
                    controller: nameController,
                    labelText: "Nome da Compra",
                    hintText: "Escreva no nome da compra.",
                    maxWidth: contextWidth),
                  DefaultFormField(
                    controller: dateController,
                    labelText: "Data da Compra",
                    hintText: "20/02/2005",
                    maxWidth: contextWidth),
                  DefaultButtonRow(
                    onConfirm: () {
                      String date = dateController.text;
                      List<int> dateParts = date.split("/").map((d) => int.parse(d)).toList();
                      DateTime formatedDate = DateTime(dateParts[2], dateParts[1], dateParts[0]);

                      viewModel.cadastrar(ShopSave(nameController.text, formatedDate));

                      limparCampos();

                      Navigator.pushNamed(context, RouteGenerator.InitialPage);
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
