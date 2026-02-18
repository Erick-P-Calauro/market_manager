import 'package:flutter/material.dart';
import 'package:market_manager/data/model/Product.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/ProductAddViewModel.dart';
import 'package:market_manager/ui/widgets/ButtonDropdownField.dart';
import 'package:market_manager/ui/widgets/ButtonTextField.dart';
import 'package:market_manager/ui/widgets/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/utils/Enums.dart';
import '../widgets/Header.dart';

class ProductAddPage extends StatelessWidget {
  ProductAddPage({super.key, required this.viewModel, required this.state, this.payload});

  final ProductAddViewModel viewModel;
  final scrollController = ScrollController();
  
  final PageState state;
  final dynamic payload;

  @override
  Widget build(BuildContext context) {

    if(state == PageState.edit) {
      viewModel.definirProduto(payload!);
    }

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
                  product: viewModel.produtoEscolhido,
                  categories: viewModel.categories.map((cat) => cat.name).toList(),
                  onSubmitForm: (String categoria, String nome, String barcode) {
                    if(state == PageState.register) {
                      viewModel.cadastrarProduto(categoria, nome, barcode).then((r) => {
                        if(context.mounted) {
                          Navigator.pushNamed(context, RouteGenerator.ListProductPage)
                        }
                      });
                    }

                    if(state == PageState.edit) {
                      viewModel.editarProduto(payload!, categoria, nome, barcode).then((r) => {
                        if(context.mounted) {
                          Navigator.pushNamed(context, RouteGenerator.ListProductPage)
                        }
                      });
                    }
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

// ignore: must_be_immutable
class ProductForm extends StatefulWidget {
  ProductForm({super.key, required this.categories, this.product, required this.onSubmitForm});

  Product? product;
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

    if(widget.product != null) {
      nomeProduto.text = widget.product!.name;
      barcode.text = widget.product!.barcode;
      categoriaEscolhida = widget.product!.category.name;
    }

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
          initialValue: categoriaEscolhida != "" ? categoriaEscolhida : null,
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
          },
        )
      ],
    )
  );
  }
}
