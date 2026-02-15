import 'package:flutter/material.dart';
import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/ProductViewModel.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/ListSection.dart';
import '../widgets/Header.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key, required this.viewModel});

  final ProductViewModel viewModel;
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
            HeaderPlus<Object>(
              text: "Produtos",
              newPage: RouteGenerator.NewProductPage,
            ),
            ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewModel.products.length,
                  separatorBuilder: (context, int index) {
                    return const SizedBox(height: 15);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    Category category = viewModel.categories[index];
                    List<String> productNames = viewModel.products[index].map((product) => product.name).toList();
      
                    return ListSection(
                      title: category.name,
                      items: productNames
                    );
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
