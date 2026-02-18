import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/CategoryListViewModel.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/EntityCard.dart';
import 'package:market_manager/ui/widgets/RouteArguments/CategoryEditArguments.dart';
import 'package:market_manager/utils/Enums.dart';
import '../widgets/Header.dart';

class CategoryListPage extends StatelessWidget {
  CategoryListPage({super.key, required this.viewModel});

  final CategoryListViewModel viewModel;
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
            HeaderPlus(
              text: "Categorias",
              newPage: RouteGenerator.NewCategoryPage,
            ),
            ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewModel.categories.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 15);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return EntityCard(
                      text: viewModel.categories[index].name,
                      onEdit: () => {
                        Navigator.of(context)
                          .pushNamed(
                            RouteGenerator.EditCategoryPage, 
                            arguments: CategoryEditArguments(
                              mode: PageState.edit, 
                              categoryId: viewModel.categories[index].id
                            )
                          )
                      },
                      onDelete: () => {
                        viewModel.deletarCategoria(viewModel.categories[index].id),
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

