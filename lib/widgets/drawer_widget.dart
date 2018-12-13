import 'package:flutter/material.dart';
import '../pages/product_manager.dart';
import '../pages/home.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(title: Text('Choose'), automaticallyImplyLeading: false,),
          ListTile(
            title: Text('Manager Product'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/'); 
            },
          ),
          ListTile(
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
