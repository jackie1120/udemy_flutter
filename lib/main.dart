import 'package:flutter/material.dart';
import './pages/auth.dart';
import './pages/product_manager.dart';
import './pages/home.dart';

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
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => ProductManager(),
        '/list': (BuildContext context) => HomePage(),
      },
    );
  }
}
