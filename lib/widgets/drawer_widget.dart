import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(title: Text('Choose'), automaticallyImplyLeading: false,),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Manager Product'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/product_manager'); 
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('List Product'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/list'); 
            },
          )
        ],
      ),
    );
  }
}
