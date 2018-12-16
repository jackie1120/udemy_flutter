import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function addProduct;

  ProductCreate(this.addProduct);
  @override
  State<StatefulWidget> createState() {
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreate> {
  String title;
  String description;
  double price;
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    Widget test =  Center(
      child: RaisedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return Center(child: Text('This is a modal'),);
            });
        },
        child: Text('Show modal'),
      ),
    );

    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Product Title'
            ),
            onChanged: (String value) {
              setState(() {
                title = value;
              });
            },
          ),
          TextField(
            maxLength: 4,
            decoration: InputDecoration(
              labelText: 'Product Description',
            ),
            onChanged: (String value) {
              setState(() {
                description = value;
              });
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Product Price'
            ),
            onChanged: (String value) {
              setState(() {
                price = double.parse(value);
              });
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
            onPressed: () {
              final product = {
                'title': title,
                'imageUrl': 'assets/firewatch.jpg',
                'description': description,
                'price': price
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, '/list');
            },
          )
        ],
      ),
    );
  }
}
