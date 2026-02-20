import 'package:flutter/material.dart';
import 'package:market_manager/ui/model/ItemAddViewModel.dart';
import 'package:market_manager/ui/widgets/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/DefaultCheckboxField.dart';
import 'package:market_manager/ui/widgets/DefaultDropdownField.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
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
                return ItemForm();
              }
            )
          ],
        ),
      )
    );
  }
}

class ItemForm extends StatefulWidget {
  const ItemForm({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ItemFormState();
  }
  
}

class _ItemFormState extends State<ItemForm> {
  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;

    return Form(
      child: Column(
        spacing: 20,
        children: [
          DefaultDropdownField(
            labelText: "Categoria", 
            hintText: "Bebidas", 
            maxWidth: contextWidth, 
            value: null,
            items: [],
          ),
          DefaultDropdownField(
            labelText: "Produto", 
            hintText: "Refrigerante",
            maxWidth: contextWidth, 
            value: null,
            items: [],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultFormField(
                labelText: "Quantidade", 
                hintText: "10", 
                maxWidth: (contextWidth) / 2 - 30, 
                controller: null,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              DefaultDropdownField(
                labelText: "Un. Medida", 
                hintText: "KG",
                maxWidth: (contextWidth) / 2 - 30, 
                value: null,
                items: [],
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
                controller: null,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              DefaultCheckboxField(
                labelText: "Adicionar na Compra", 
                onChecked: () => {}, 
                width:(contextWidth) / 2 - 30,
              ),
            ],
          ),

          DefaultButtonRow(
            onConfirm: () => {}
          )
        ],
      ),
    );
  }
}