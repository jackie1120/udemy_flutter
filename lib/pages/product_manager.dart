import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';
import './product_edit.dart';
import './product_list.dart';

class ProductManager extends StatelessWidget {
  final Function addProduct;
  final Function updateProduct;
  final List<Map<String, dynamic>> products;

  ProductManager(this.addProduct, this.updateProduct, this.products);

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
          ProductEdit(addProduct: addProduct),
          ProductList(products, updateProduct)
        ],),
      ),
    );
  }
}
