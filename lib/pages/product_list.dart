import 'package:flutter/material.dart';
import './product_edit.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/main.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(children: <Widget>[
            Dismissible(
              key: Key(model.products[index].title),
              background: Container(color: Colors.red,),
              onDismissed: (DismissDirection direction) {
                print(direction);
                model.setSelectProductIndex(index);
                model.deleteProduct();
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(model.products[index].imageUrl),
                ),
                title: Text(model.products[index].title),
                subtitle: Text('\$${model.products[index].price}'),
                trailing: _editButtonBuilder(context, index, model),
              ),
            ),
            Divider()
          ],);
        },
        itemCount: model.products.length,
      );
    },);
  }

  Widget _editButtonBuilder(BuildContext context, int index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.setSelectProductIndex(index);
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => ProductEdit()
        ));
      },
    );
  }
}
