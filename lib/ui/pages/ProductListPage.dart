import 'package:flutter/material.dart';
import 'package:market_manager/data/model/Category.dart';
import 'package:market_manager/data/model/Product.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/ui/model/ProductViewModel.dart';
import 'package:market_manager/ui/widgets/DefaultScaffold.dart';
import 'package:market_manager/ui/widgets/EntityCard.dart';
import 'package:market_manager/ui/widgets/RouteArguments/ProductEditArguments.dart';
import 'package:market_manager/utils/Typograph.dart';
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
                    List<Product> products = viewModel.products[index];
      
                    return SizedBox(
                      child: Column(
                      spacing: 15,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: Typograph.TitleSmall.copyWith(fontWeight: FontWeight.w400),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: products.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 15);
                          }, 
                          itemBuilder: (context, index) {
                            return EntityCard(
                              text: products[index].name, 
                              onEdit: () => {
                                Navigator.pushNamed(
                                  context, RouteGenerator.EditProductPage, 
                                  arguments: ProductEditArguments(productId: products[index].id)
                                )
                              }, 
                              onDelete: () {
                                viewModel.deletarProduto(products[index].id).then((r) => {
                                  if(context.mounted) {
                                    Navigator.pushNamed(context, RouteGenerator.ListProductPage)
                                  }
                                });
                              }
                            );
                          }
                        )
                      ],
                    ));
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