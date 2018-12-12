import 'package:flutter/material.dart';
import './products.dart';

class ProductManager extends StatefulWidget {
  final String _initString;

  ProductManager(this._initString);

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    _products.add(widget._initString);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                _products.add('Food 2');              
              });
            },
            child: Text('Add'),
          ),
        ),
        Expanded(
          child: Products(_products)
        ) 
      ],
    );
  }
}