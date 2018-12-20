import 'package:flutter/material.dart';
import '../model/product.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/products.dart';

class ProductEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductEditState();
  }
}

class _ProductEditState extends State<ProductEdit> {
  String title;
  String description;
  double price;
  bool isAccepted = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  final Map tempProduct = {
    'title': null,
    'imageUrl': 'assets/firewatch.jpg',
    'description': null,
    'price': null
  };

  void _submitForm(ProductsModel model) {
    if(!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if(model.selectProductIndex == null) {
      model.addProduct(Product(
        title: tempProduct['title'],
        description: tempProduct['description'],
        imageUrl: tempProduct['imageUrl'],
        price: tempProduct['price'],
      ));
    } else {
      model.updateProduct(
        Product(
          title: tempProduct['title'],
          description: tempProduct['description'],
          imageUrl: tempProduct['imageUrl'],
          price: tempProduct['price'],
        ));
    }
    Navigator.pushReplacementNamed(context, '/list');
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(builder: (BuildContext context, Widget child, ProductsModel model) {
      int selectProductIndex = model.selectProductIndex;
      Product product = selectProductIndex == null ? null : model.products[selectProductIndex];
      Widget content = GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child:  Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Product Title'
                  ),
                  validator: (String value) {
                    if(value.isEmpty || value.trim().length < 5) {
                      return 'Title is required and shoule be 5+ characters long';
                    }
                  },
                  initialValue: product == null ? '' : product.title,
                  onSaved: (String value) {
                    tempProduct['title'] = value;
                  },
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Product Description',
                  ),
                  validator: (String value) {
                    if(value.isEmpty || value.trim().length < 10) {
                      return 'Description is required and should be 10+ characters long';
                    }
                  },
                  initialValue: product == null ? '' : product.description,
                  onSaved: (String value) {
                    tempProduct['description'] = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Product Price'
                  ),
                  validator: (String value) {
                    if(value.isEmpty || !RegExp(r'^(?:[1-9]\d*|0)(?:\.\d+)?$').hasMatch(value)) {
                      return 'Price is required and must be a number';
                    }
                  },
                  initialValue: product == null ? '' : product.price.toString(),
                  onSaved: (String value) {
                    tempProduct['price'] = double.parse(value);
                  },
                ),
                SwitchListTile(
                  value: isAccepted,
                  onChanged: (value) {
                    setState(() {
                      isAccepted = value;            
                    });
                  },
                  title: Text('Accept Terms'),
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  child: Text('Save'),
                  onPressed: () {_submitForm(model);},
                )
              ],
            ),
          ),
        ),
      );
      if(product == null) {
        return content;
      } else {
        return Scaffold(
          appBar: AppBar(title: Text('Edit Product'),),
          body: content,
        );
      }
    },);
  }
}
