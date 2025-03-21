import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const defaultPadding = EdgeInsets.fromLTRB(20, 30, 0, 30);

    return Drawer(
        backgroundColor: CustomColors.BlueMarket,
        shape: Border.all(width: 0),
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
                          spacing: 15,
                          children: [
                            ListTile(
                              horizontalTitleGap: 10,
                              leading: Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                                size: 30,
                              ),
                              title: Text("Adicionar Lista",
                                  style: Typograph.HeadlineMedium),
                              onTap: () => {print("Adicionar Lista")},
                            ),
                            ListTile(
                                leading: Icon(
                                  Icons.shopping_basket,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                title: Text("Registrar Produto",
                                    style: Typograph.HeadlineMedium),
                                onTap: () => {print("Registrar Produto")}),
                          ],
                        )),
                    Divider(color: Colors.black, height: 0),
                    Container(
                      padding: defaultPadding,
                      child: Column(
                        spacing: 15,
                        children: [
                          ListTile(
                              leading: Icon(Icons.description,
                                  color: Colors.black, size: 30),
                              title: Text("Produtos",
                                  style: Typograph.HeadlineMedium),
                              onTap: () => {print("Produtos")}),
                          ListTile(
                              leading: Icon(Icons.list,
                                  color: Colors.black, size: 30),
                              title: Text("Categorias",
                                  style: Typograph.HeadlineMedium),
                              onTap: () => {print("Categorias")}),
                          ListTile(
                              leading: Icon(Icons.mode_edit,
                                  color: Colors.black, size: 30),
                              title: Text("Unidades de M.",
                                  style: Typograph.HeadlineMedium),
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
                            title: Text("Configurações",
                                style: Typograph.HeadlineMedium),
                            onTap: () => {print("Configurações")}))
                  ],
                ))));
  }
}
