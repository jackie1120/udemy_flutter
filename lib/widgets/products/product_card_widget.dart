import 'package:flutter/material.dart';
import './price_tag_widget.dart';
import '../../model/product.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_model/main.dart';

class ProductCardWidget extends StatelessWidget {
  final Product _product;
  final int _index;

  ProductCardWidget(this._product, this._index);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(_product.imageUrl),
          SizedBox(height: 18.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Expanded(child: Text(
              _product.title, 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40
              ),
              ),
            ),
            SizedBox(width: 10.0,),
            PriceTagWidget(_product.price.toString()),
          ],),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                width: 1.0,
                color: Colors.grey,
              )
            ),
            child: Text('长沙县图书馆,湖南'),
          ),
          Text(_product.userEmail),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.pushNamed<bool>(
                    context, 
                    '/product/' + _index.toString()
                  ).then((bool isDeleted) {
                    if(isDeleted) {
                      // _deleteProduct(_index);
                    }
                  });
                },
              ),
              ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model) {
                return IconButton(
                  icon: model.products[_index].isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    model.setSelectProductIndex(_index);
                    model.toggletProductFavoriteStatus();
                  },
                );
              },),
              
            ],
          )
        ],
      ),
    );
  }
}