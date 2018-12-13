import 'package:flutter/material.dart';
import '../product_container.dart';
import '../widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Products list'),
      ),
      body: ProductManager({'title': 'Food 1', 'imageUrl': 'assets/firewatch.jpg'}),
    );
  }
}
