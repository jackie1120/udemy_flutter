import 'package:flutter/material.dart';
import './product_card_widget.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_model/main.dart';

class Products extends StatelessWidget {
  Widget _bulidListView(BuildContext context, products) {
    Widget productCards;
    if(products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (context, index) {
          return ProductCardWidget(products[index], index);
        },
        itemCount: products.length,
      );
    } else {
      productCards = Container(child: Center(child: Text('no content', style: TextStyle(color: Colors.grey),),),);
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget widget, MainModel model) {
      return _bulidListView(context, model.displayProducts);
    },) ;
  }
}
