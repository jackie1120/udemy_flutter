import 'package:flutter/material.dart';
import './product_container.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Products list'),
        ),
        body: ProductManager('Food 1'),
      ),
    );
  }
}
