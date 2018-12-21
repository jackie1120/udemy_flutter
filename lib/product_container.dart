import 'package:flutter/material.dart';
import './widgets/products/products.dart';

class ProductContainer extends StatelessWidget {
  // @override
  // void initState() {
  //   _products.add(widget._initString);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Products();
    // return Column(
    //   children: <Widget>[
    //     Container(
    //       margin: EdgeInsets.all(10.0),
    //       child: 
    //       RaisedButton(
    //         color: Theme.of(context).primaryColor,
    //         onPressed: () => _addProduct({'title': 'Food 2', 'imageUrl': 'assets/firewatch.jpg'}),
    //         child: Text('Add'),
    //       ),
    //     ),
    //     Expanded(
    //       child: Products()
    //     ) 
    //   ],
    // );
  }
}