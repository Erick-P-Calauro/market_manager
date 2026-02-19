import 'package:flutter/material.dart';
import 'package:market_manager/data/model/MeasureUnity.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/MeasureUnityAddViewModel.dart';
import 'package:market_manager/ui/widgets/DefaultButtonRow.dart';
import 'package:market_manager/ui/widgets/DefaultFormField.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/Header.dart';
import 'package:market_manager/utils/Enums.dart';

class UnityAddPage extends StatelessWidget {
  UnityAddPage({super.key, required this.viewModel, required this.state, this.payload});

  final MeasureUnityAddViewModel viewModel;
  final ScrollController scrollController = ScrollController();
  
  final PageState state;
  final dynamic payload;

  @override
  Widget build(BuildContext context) {

    if(state == PageState.edit) {
      viewModel.definirUnidade(payload!);
    }

    return DefaultScaffold(
      controller: scrollController,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          spacing: 40,
          children: [
            Header(text: state == PageState.edit ? "Edição de Unidades" : "Cadastro de Unidades"),
            ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {
                return UnityForm(
                  unity: viewModel.unityEscolhida,
                  onConfirm: (String name, String abbreviation) => {
                    if(state == PageState.register) {
                      viewModel.cadastrar(MeasureUnity(id: null, name: name, abbreviation: abbreviation)),
                      Navigator.of(context)
                        .pushNamed(RouteGenerator.ListUnityPage)
                    },
          
                    if(state == PageState.edit) {
                      viewModel.editar(payload, MeasureUnity(id: payload, name: name, abbreviation: abbreviation)),
                      Navigator.of(context)
                        .pushNamed(RouteGenerator.ListUnityPage)
                    }
                  }
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class UnityForm extends StatefulWidget {
  const UnityForm({
    super.key,
    required this.onConfirm, 
    this.unity
  });

  final Function onConfirm;
  final MeasureUnity? unity;
  
  @override
  State<StatefulWidget> createState() {
    return _UnityFormState();
  }
  
}

class _UnityFormState extends State<UnityForm> {
  
  final nameController = TextEditingController();
  final abbreviationController = TextEditingController();

  void limparCampos() {
    nameController.text = "";
    abbreviationController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;
    
    if(widget.unity != null) {
      nameController.text = widget.unity!.name;
      abbreviationController.text = widget.unity!.abbreviation;
    }

    return Form(
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
            onConfirm: () {
              widget.onConfirm(nameController.text, abbreviationController.text);
              limparCampos();
            },
          )
        ],
      ),
    );
  }
}
