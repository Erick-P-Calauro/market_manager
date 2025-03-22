import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPadding = EdgeInsets.fromLTRB(5, 20, 0, 20);
    final defaultTextStyle = Typograph.HeadlineMedium;
    final defaultSpacing = 5.0;

    return Drawer(
        backgroundColor: CustomColors.BlueMarket,
        shape: Border.all(width: 0),
        width: 270,
        child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            child: Container(
                color: CustomColors.LightGray1,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    Container(
                        padding: defaultPadding,
                        child: Column(
                          spacing: defaultSpacing,
                          children: [
                            ListTile(
                              horizontalTitleGap: 10,
                              leading: Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                                size: 30,
                              ),
                              title: Text("Adicionar Lista",
                                  style: defaultTextStyle),
                              onTap: () => {print("Adicionar Lista")},
                            ),
                            ListTile(
                                leading: Icon(
                                  Icons.shopping_basket,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                title: Text("Registrar Produto",
                                    style: defaultTextStyle),
                                onTap: () => {print("Registrar Produto")}),
                          ],
                        )),
                    Divider(color: Colors.black, height: 0),
                    Container(
                      padding: defaultPadding,
                      child: Column(
                        spacing: defaultSpacing,
                        children: [
                          ListTile(
                              leading: Icon(Icons.description,
                                  color: Colors.black, size: 30),
                              title: Text("Produtos", style: defaultTextStyle),
                              onTap: () => {print("Produtos")}),
                          ListTile(
                              leading: Icon(Icons.list,
                                  color: Colors.black, size: 30),
                              title:
                                  Text("Categorias", style: defaultTextStyle),
                              onTap: () => {print("Categorias")}),
                          ListTile(
                              leading: Icon(Icons.mode_edit,
                                  color: Colors.black, size: 30),
                              title: Text("Unidades de M.",
                                  style: defaultTextStyle),
                              onTap: () => {print("Unidades de Medida")}),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 0,
                    ),
                    Padding(
                        padding: defaultPadding,
                        child: ListTile(
                            leading: Icon(Icons.settings,
                                color: Colors.black, size: 30),
                            title:
                                Text("Configurações", style: defaultTextStyle),
                            onTap: () => {print("Configurações")}))
                  ],
                ))));
  }
}
