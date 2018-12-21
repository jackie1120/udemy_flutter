import 'package:flutter/material.dart';
import './product_card_widget.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_model/products.dart';

class Products extends StatelessWidget {
  Widget _bulidListView(BuildContext context, products, deleteProduct) {
    Widget productCards;
    if(products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (context, index) {
          return ProductCardWidget(products[index], index, deleteProduct);
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
    return ScopedModelDescendant<ProductsModel>(builder: (BuildContext context, Widget widget, ProductsModel model) {
      return _bulidListView(context, model.displayProducts, model.deleteProduct);
    },) ;
  }
}
