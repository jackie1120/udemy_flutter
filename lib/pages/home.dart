import 'package:flutter/material.dart';
import '../product_container.dart';
import '../widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> _products;
  final Function _addProduct;
  final Function _deleteProduct;

  HomePage(this._products, this._addProduct, this._deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Products list'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
      body: ProductContainer(_products, _addProduct, _deleteProduct),
    );
  }
}
