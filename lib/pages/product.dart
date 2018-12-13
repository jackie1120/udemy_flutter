import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, String> _product;

  ProductPage(this._product);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(_product['imageUrl']),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(_product['title']),
            ),
            RaisedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('DELETE'),
            )
          ],
        )
      )
    );
  }
}
