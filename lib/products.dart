import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products.map((product) =>
        Card(
          child: Column(
            children: <Widget>[
              Image.network(
                  'https://c.wallhere.com/images/fa/6a/d45cc39d45f258beb8bdc92fc6ad-1505361.png!s'),
              Text('Food Paradise')
            ],
          ),
        )
      ).toList(),
    );
  }
}