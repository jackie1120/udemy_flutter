import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function _deleteProduct;

  Products(this.products, this._deleteProduct);

  Widget _productItemBuilder(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['imageUrl']),
          SizedBox(height: 18.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Expanded(child: Text(
              products[index]['title'], 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40
              ),
              ),
            ),
            SizedBox(width: 10.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(4.0)
              ),
              child: Text(
                '\$${products[index]['price'].toString()}', 
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
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
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.pushNamed<bool>(
                    context, 
                    '/product/' + index.toString()
                  ).then((bool isDeleted) {
                    if(isDeleted) {
                      _deleteProduct(index);
                    }
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _productItemBuilder,
      itemCount: products.length,
    );
  }
}
