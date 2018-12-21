import 'package:flutter/material.dart';
import '../widgets/products/price_tag_widget.dart';
import '../model/product.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/main.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  _showConfirmDialog(BuildContext context, MainModel model) {
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
                model.deleteProduct();
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
        body: ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model) {
          Product product = model.products[productIndex];
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(product.imageUrl),
              Text(
                product.title,
                style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('长沙县图书馆,湖南', style: TextStyle(color: Colors.grey)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child:Text('|', style: TextStyle(color: Colors.grey),),),
                  PriceTagWidget(product.price.toString()),
                ],
              ),
              Container(
                padding: EdgeInsets.all(4.0),
                child:Text(
                product.description
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  model.setSelectProductIndex(productIndex);
                  _showConfirmDialog(context, model);
                } ,
              )
            ],
          );
        },) 
      )
    );
  }
}
