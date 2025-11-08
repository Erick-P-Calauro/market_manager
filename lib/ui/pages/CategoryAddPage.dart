import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/CategoryAddViewModel.dart';
import 'package:market_manager/ui/widgets/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/Header.dart';
import 'package:market_manager/utils/Enums.dart';

class CategoryAddPage extends StatefulWidget {
  
  const CategoryAddPage({super.key, required this.viewModel, required this.mode, this.categoryId});

  final CategoryAddViewModel viewModel; // Injetado via contexto
  final AddPageState mode; // Passado por argumento na rota
  final int? categoryId; // Passado por argumento na rota
  
  @override
  State<StatefulWidget> createState() {
    return CategoryAddPageState();
  }
}

class CategoryAddPageState extends State<CategoryAddPage> {
  CategoryAddPageState();

  final categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if(widget.mode == AddPageState.edit) {
      widget.viewModel.carregarCategoria(widget.categoryId!).then((category) => {
        if(category != null) {
          categoryController.text = widget.viewModel.category!.name
        }
      });
    }
  }

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
                      controller: categoryController,
                      labelText: "Nome da categoria",
                      hintText: "Escreva o nome da categoria",
                      maxWidth: contextWidth),
                  DefaultButtonRow(
                    onConfirm: () => {
                      if(widget.mode == AddPageState.register) {
                        widget.viewModel.cadastrarCategoria(categoryController.text),
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.ListCategoryPage)
                      },

                      if(widget.mode == AddPageState.edit) {
                        widget.viewModel.editarCategoria(categoryController.text, widget.categoryId!),
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.ListCategoryPage)
                      }
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
