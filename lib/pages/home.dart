import 'package:flutter/material.dart';
import '../product_container.dart';
import '../widgets/drawer_widget.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/products.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Products list'),
        actions: <Widget>[
          ScopedModelDescendant<ProductsModel>(builder: (BuildContext context, Widget child, ProductsModel model) {
            return IconButton(
              icon: model.showFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              onPressed: () {
                model.toggleDisplayFavoriteProducts();
              },
            );
          },),
        ],
      ),
      body: ProductContainer(),
    );
  }
}
