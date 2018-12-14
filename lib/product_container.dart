import 'package:flutter/material.dart';
import './products.dart';

class ProductContainer extends StatelessWidget {
  List<Map<String, String>> _products = [];
  final Function _addProduct;
  final Function _deleteProduct;

  ProductContainer(this._products, this._addProduct, this._deleteProduct);

  // @override
  // void initState() {
  //   _products.add(widget._initString);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () => _addProduct({'title': 'Food 2', 'imageUrl': 'assets/firewatch.jpg'}),
            child: Text('Add'),
          ),
        ),
        Expanded(
          child: Products(_products, _deleteProduct)
        ) 
      ],
    );
  }
}