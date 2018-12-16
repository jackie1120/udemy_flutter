import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> _product;

  ProductPage(this._product);

  _showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure'),
          content: Text('This is undoone'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Discard'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
              child: Text('Continue'),
            )
          ],
        );
      }
    );
  }

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
              onPressed: () => _showConfirmDialog(context),
              child: Text('DELETE'),
            )
          ],
        )
      )
    );
  }
}
