import 'package:flutter/material.dart';
import './product_card_widget.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function _deleteProduct;

  Products(this.products, this._deleteProduct);

  Widget _productItemBuilder(BuildContext context, int index) {
    return ProductCardWidget(products[index], index, _deleteProduct);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ProductCardWidget(products[index], index, _deleteProduct);
      },
      itemCount: products.length,
    );
  }
}
