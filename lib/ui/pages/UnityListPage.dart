import 'package:flutter/material.dart';
import 'package:market_manager/data/model/MeasureUnity.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/MeasureUnityViewModel.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/EntityCard.dart';
import 'package:market_manager/ui/widgets/RouteArguments/MeasureUnityEditArguments.dart';

import '../widgets/Header.dart';

class UnityListPage extends StatelessWidget {
  UnityListPage({super.key, required this.viewModel});

  final MeasureUnityViewModel viewModel;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return DefaultScaffold(
      controller: scrollController,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          spacing: 40,
          children: [
            HeaderPlus<Object>(
              text: "Unidades de Medida",
              newPage: RouteGenerator.NewUnityPage,
            ),
            ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewModel.unities.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 15);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    MeasureUnity unity = viewModel.unities[index];

                    return EntityCard(
                      text: "${unity.name} (${unity.abbreviation})", 
                      onEdit: () {
                        Navigator.pushNamed(context, RouteGenerator.EditUnityPage, arguments: MeasureUnityEditArguments(unityId: unity.id!));
                      },
                      onDelete: () {
                        viewModel.deletar(unity.id!);
                      }
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


