import 'package:flutter/material.dart';
import '../widgets/products/price_tag_widget.dart';

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
            Text(
              _product['title'],
              style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('长沙县图书馆,湖南', style: TextStyle(color: Colors.grey)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child:Text('|', style: TextStyle(color: Colors.grey),),),
                PriceTagWidget(_product['price'].toString()),
              ],
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child:Text(
              _product['description']
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () => _showConfirmDialog(context),
            )
          ],
        )
      )
    );
  }
}
