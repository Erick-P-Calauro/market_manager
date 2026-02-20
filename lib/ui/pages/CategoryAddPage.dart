import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/CategoryAddViewModel.dart';
import 'package:market_manager/ui/widgets/FormFields/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/FormFields/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/Header.dart';
import 'package:market_manager/utils/Enums.dart';

class CategoryAddPage extends StatelessWidget {
  CategoryAddPage(
      {super.key,
      required this.viewModel,
      required this.state,
      this.payload});

  final CategoryAddViewModel viewModel; // Injetado via contexto
  final PageState state; // Passado por argumento na rota

  final dynamic payload; // Passado por argumento na rota

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    if(state == PageState.edit) {
      viewModel.definirCategoria(payload);
    }

    return DefaultScaffold(
      controller: scrollController,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          spacing: 40,
          children: [
            Header(text: state == PageState.edit ? "Edição de categorias" : "Cadastro de categorias"),
            ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {                
                return CategoryForm(
                  category: viewModel.categoryEscolhida?.name,
                  onConfirm: (String category) => {
                    if (state == PageState.register){
                      viewModel.cadastrarCategoria(category),
                      Navigator.of(context).pushNamed(RouteGenerator.ListCategoryPage)
                    },
          
                    if(state == PageState.edit){
                      viewModel.editarCategoria(category, payload!),
                      Navigator.of(context).pushNamed(RouteGenerator.ListCategoryPage)
                    }
                  }
                );
              }
            )
          ],
        ),
      ),
    );
  }
  
}

// ignore: must_be_immutable
class CategoryForm extends StatefulWidget {
  const CategoryForm({
    super.key,
    this.category,
    required this.onConfirm,
  });
  
  final String? category;
  final Function onConfirm;

  @override
  State<StatefulWidget> createState() {
    return _CategoryFormState();
  }
}

class _CategoryFormState extends State<CategoryForm> {

  final categoryController = TextEditingController();

  void limparCampos() {
    categoryController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;

    if(widget.category != null) {
      categoryController.text = widget.category!;
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
              widget.onConfirm(categoryController.text),
              limparCampos(),
            },
          )
        ],
      ),
    );
  }
} 
