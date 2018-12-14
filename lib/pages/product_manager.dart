import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';
import './product_create.dart';
import './product_list.dart';

class ProductManager extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text('Product Manager'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.create),
              text: 'Create Product',
            ),
            Tab(
              icon: Icon(Icons.list),
              text: 'My Product',
            )
          ],),
        ),
        body: TabBarView(children: <Widget>[
          ProductCreate(),
          ProductList()
        ],),
      ),
    );
  }
}
