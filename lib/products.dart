import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function _deleteProduct;

  Products(this.products, this._deleteProduct);

  Widget _productItemBuilder(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['imageUrl']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Detail'),
                onPressed: () {
                  Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductPage(products[index]))
                  ).then((bool isDeleted) {
                    if(isDeleted) {
                      _deleteProduct(index);
                    }
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _productItemBuilder,
      itemCount: products.length,
    );
  }
}
