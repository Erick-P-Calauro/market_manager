import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/ProductAddViewModel.dart';
import 'package:market_manager/ui/widgets/ButtonDropdownField.dart';
import 'package:market_manager/ui/widgets/ButtonTextField.dart';
import 'package:market_manager/ui/widgets/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import '../widgets/Header.dart';

class ProductAddPage extends StatelessWidget {
  ProductAddPage({super.key, required this.viewModel});

  final ProductAddViewModel viewModel;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return DefaultScaffold(
      controller: scrollController,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          spacing: 40,
          children: [
            Header(text: "Cadastro de Produtos"),
            ListenableBuilder(
              listenable: viewModel, 
              builder: (context, child) {
                return ProductForm(
                  categories: viewModel.categories.map((cat) => cat.name).toList(),
                  onSubmitForm: (String categoria, String nome, String barcode) => {
                    viewModel.cadastrarProduto(categoria, nome, barcode)
                  },
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

class ProductForm extends StatefulWidget {
  const ProductForm({super.key, required this.categories, required this.onSubmitForm});

  final List<String> categories;
  final Function onSubmitForm;

  @override
  State<StatefulWidget> createState() {
    return _ProductFormState();
  }
}

class _ProductFormState extends State<ProductForm> {

  final TextEditingController nomeProduto = TextEditingController();
  final TextEditingController barcode = TextEditingController();
  String? categoriaEscolhida;

  void limparCampos() {
    nomeProduto.clear();
    barcode.clear();
    categoriaEscolhida = null;
  }

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;

    return Form(
      child: Column(
      spacing: 25,
      children: [
        DefaultFormField(
          controller: nomeProduto,
          labelText: "Nome do Produto",
          hintText: "Digite o nome do Produto",
          maxWidth: contextWidth,
        ),
        ButtonDropdownField(
          labelText: "Categoria",
          hintText: "Escolha a categoria do produto",
          width: contextWidth - 94,
          onTap: () => {print("Nova Categoria")},
          icon: Icons.add_box,
          items: widget.categories,
          onChanged: (String value) {
            setState(() {
              categoriaEscolhida = value;
            });
          }
        ),
        ButtonTextField(
          labelText: "Código de Barras",
          hintText: "Insira ou escaneie o código de barras",
          maxWidth: contextWidth - 94,
          onTap: () => {print("Escaneando...")},
          icon: Icons.camera_alt,
          controller: barcode,
        ),
        DefaultButtonRow(
          onConfirm: () {
            widget.onSubmitForm(categoriaEscolhida!, nomeProduto.text,  barcode.text);
            limparCampos();
            Navigator.pushNamed(context, RouteGenerator.ListProductPage);
          },
        )
      ],
    )
  );
  }
}
