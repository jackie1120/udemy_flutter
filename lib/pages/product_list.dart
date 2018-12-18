import 'package:flutter/material.dart';
import './product_edit.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;

  ProductList(this.products, this.updateProduct);

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Image.asset(products[index]['imageUrl'],width: 60.0,),
      title: Text(products[index]['title']),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => ProductEdit(product: products[index], productIndex: index, updateProduct: updateProduct,)
          ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: products.length,
    );
  }
}
