import 'package:flutter/material.dart';
import './product_edit.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductList(this.products, this.updateProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: products.length,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Column(children: <Widget>[
      Dismissible(
        key: Key(products[index]['title']),
        background: Container(color: Colors.red,),
        onDismissed: (DismissDirection direction) {
          print(direction);
          deleteProduct(index);

        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(products[index]['imageUrl']),
          ),
          title: Text(products[index]['title']),
          subtitle: Text('\$${products[index]['price']}'),
          trailing: _editButtonBuilder(context, index),
        ),
      ),
      Divider()
    ],);
  }

  Widget _editButtonBuilder(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => ProductEdit(product: products[index], productIndex: index, updateProduct: updateProduct,)
        ));
      },
    );
  }
}
