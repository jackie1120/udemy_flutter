import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;

  ProductEdit({this.addProduct, this.product, this.updateProduct, this.productIndex});
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
  
  final Map<String, dynamic> product = {
    'title': null,
    'imageUrl': 'assets/firewatch.jpg',
    'description': null,
    'price': null
  };

  void _submitForm() {
    if(!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if(widget.product == null) {
      widget.addProduct(product);
    } else {
      widget.updateProduct(product, widget.productIndex);
    }
    Navigator.pushReplacementNamed(context, '/list');
  }

  @override
  Widget build(BuildContext context) {
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
                initialValue: widget.product == null ? '' : widget.product['title'],
                onSaved: (String value) {
                  product['title'] = value;
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
                initialValue: widget.product == null ? '' : widget.product['description'],
                onSaved: (String value) {
                  product['description'] = value;
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
                initialValue: widget.product == null ? '' : widget.product['price'].toString(),
                onSaved: (String value) {
                  product['price'] = double.parse(value);
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
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    );
    if(widget.product == null) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(title: Text('Edit Product'),),
        body: content,
      );
    }
  }
}
