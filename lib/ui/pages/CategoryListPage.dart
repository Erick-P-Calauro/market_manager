import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/CategoryViewModel.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';
import '../widgets/Header.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key, required this.viewModel});

  final CategoryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width - 40;
    final contextHeight = MediaQuery.of(context).size.height - 120;

    return DefaultScaffold(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: Column(
          spacing: 40,
          children: [
            HeaderPlus(
              text: "Categorias",
              newPage: RouteGenerator.NewCategoryPage,
            ),
            SizedBox(
              height: contextHeight,
              child: ListenableBuilder(
                listenable: viewModel,
                builder: (context, child) {
                  return ListView.separated(
                    itemCount: viewModel.categories.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 15);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                        color: CustomColors.LightGray1,
                        width: contextWidth,
                        child: Row(
                          spacing: 20,
                          children: [
                            Icon(
                              Icons.menu,
                              size: 24,
                              color: Colors.black,
                            ),
                            Text(viewModel.categories[index].name,
                                style: Typograph.TitleSmall)
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
