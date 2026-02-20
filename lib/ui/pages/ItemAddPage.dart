import 'package:flutter/material.dart';
import 'package:market_manager/data/DTOs/ItemSave.dart';
import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/model/MeasureUnity.dart';
import 'package:market_manager/data/model/Product.dart';
import 'package:market_manager/ui/model/ItemAddViewModel.dart';
import 'package:market_manager/ui/widgets/FormFields/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/FormFields/DefaultCheckboxField.dart';
import 'package:market_manager/ui/widgets/FormFields/DefaultDropdownField.dart';
import 'package:market_manager/ui/widgets/FormFields/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/Header.dart';

class ItemAddPage extends StatelessWidget {
  ItemAddPage({super.key, required this.viewModel});

  final ItemAddViewModel viewModel;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      controller: scrollController,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: Column(
          spacing: 40,
          children: [
            Header(text: "Adicionar Item"),
            ListenableBuilder(
              listenable: viewModel, 
              builder: (context, child) {
                return ItemForm(
                  categories: viewModel.categories,
                  products: viewModel.products,
                  unities: viewModel.unities,
                  onCategoryChange: (String? category) {
                    viewModel.filtrarProdutos(category);
                  },
                  onSubmitForm: (ItemSave item) {
                    item.shop = viewModel.shopId;

                    print(item.shop);
                    print(item.product);
                    print(item.price);
                    print(item.quantity);
                    print(item.onCart);
                  }
                );
              }
            )
          ],
        ),
      )
    );
  }
}

// ignore: must_be_immutable
class ItemForm extends StatefulWidget {
  ItemForm({
    super.key, 
    required this.products, 
    required this.categories, 
    required this.unities,
    required this.onCategoryChange,
    required this.onSubmitForm
  });
  
  List<Product> products;
  List<Category> categories;
  List<MeasureUnity> unities;
  Function onCategoryChange;
  Function onSubmitForm;

  @override
  State<StatefulWidget> createState() {
    return _ItemFormState();
  }
  
}

class _ItemFormState extends State<ItemForm> {

  String? categoriaEscolhida;
  String? produtoEscolhido;
  String? unidadeEscolhida;
  bool onCart = false;

  final priceController = TextEditingController();
  final quantityController = TextEditingController();

  UniqueKey categoryKey = UniqueKey();
  UniqueKey productKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;

    return Form(
      child: Column(
        spacing: 20,
        children: [
          DefaultDropdownField(
            Rkey: categoryKey,
            labelText: "Categoria", 
            hintText: "Selecione a categoria", 
            maxWidth: contextWidth, 
            value: categoriaEscolhida,
            onChangedParam: (dynamic value) {
              setState(() {
                categoriaEscolhida = value;
                productKey = UniqueKey();
              });

              widget.onCategoryChange(value);
            },
            items: widget.categories.map((category) => category.name).toList(),
          ),
          DefaultDropdownField(
            Rkey: productKey,
            labelText: "Produto", 
            hintText: "Selecione o produto",
            maxWidth: contextWidth, 
            value: produtoEscolhido,
            onChangedParam: (dynamic value) {
              setState(() {
                produtoEscolhido = value;
              });
            },
            items: widget.products.map((product) => product.name).toList(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultFormField(
                labelText: "Quantidade", 
                hintText: "Insira quantidade", 
                maxWidth: (contextWidth) / 2 - 25, 
                controller: quantityController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              DefaultDropdownField(
                labelText: "Unidade de Medida", 
                hintText: "Selecione Un.",
                maxWidth: (contextWidth) / 2 - 25, 
                value: unidadeEscolhida,
                onChangedParam: (dynamic value) {
                  setState(() {
                    unidadeEscolhida = value;
                  });
                },
                items: widget.unities.map((unity) => unity.abbreviation).toList(),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultFormField(
                labelText: "Preço", 
                hintText: 'R\$ 100.50', 
                maxWidth: (contextWidth) / 2 - 30, 
                controller: priceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              DefaultCheckboxField(
                labelText: "Adicionar na Compra", 
                onChecked: (bool newValue) {
                  setState(() {
                    onCart = newValue;
                  });
                }, 
                width:(contextWidth) / 2 - 30,
              ),
            ],
          ),

          DefaultButtonRow(
            onConfirm: () {
              widget.onSubmitForm(ItemSave(null, produtoEscolhido!, unidadeEscolhida!, double.parse(priceController.text), int.parse(quantityController.text), onCart));
            }
          )
        ],
      ),
    );
  }
}