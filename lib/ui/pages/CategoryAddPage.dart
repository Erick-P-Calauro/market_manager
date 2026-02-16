import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/CategoryAddViewModel.dart';
import 'package:market_manager/ui/widgets/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/Header.dart';
import 'package:market_manager/utils/Enums.dart';

class CategoryAddPage extends StatelessWidget {
  CategoryAddPage(
      {super.key,
      required this.viewModel,
      required this.mode,
      this.categoryId});

  final CategoryAddViewModel viewModel; // Injetado via contexto
  final AddPageState mode; // Passado por argumento na rota
  final int? categoryId; // Passado por argumento na rota

  final categoryController = TextEditingController();
  final scrollController = ScrollController();

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
            Header(text: "Cadastro de categorias"),
            ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {
                if(mode == AddPageState.edit) {
                  viewModel.carregarCategoria(categoryId!).then((cat) => {
                    categoryController.text = cat!.name
                  });
                }

                return Form(
                  child: Column(
                    spacing: 25,
                    children: [
                      DefaultFormField(
                          controller: categoryController,
                          labelText: "Nome da categoria",
                          hintText: "Escreva o nome da categoria",
                          maxWidth: contextWidth),
                      DefaultButtonRow(
                        onConfirm: () => {
                          if (mode == AddPageState.register){
                            viewModel.cadastrarCategoria(categoryController.text),
                            Navigator.of(context).pushNamed(RouteGenerator.ListCategoryPage)
                          },
                          
                          if(mode == AddPageState.edit){
                            viewModel.editarCategoria(categoryController.text, categoryId!),
                            Navigator.of(context).pushNamed(RouteGenerator.ListCategoryPage)
                          }
                        },
                      )
                    ],
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
  
}
