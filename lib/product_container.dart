import 'package:flutter/material.dart';
import './products.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> _initString;

  ProductManager(this._initString);

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    _products.add(widget._initString);
    super.initState();
  }

  void _deleteProduct(index) {
    setState(() {
      _products.removeAt(index);
    });
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
                _products.add({'title': 'Food 2', 'imageUrl': 'assets/firewatch.jpg'});              
              });
            },
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