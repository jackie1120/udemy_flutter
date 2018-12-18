import 'package:flutter/material.dart';
import './pages/auth.dart';
import './pages/product_manager.dart';
import './pages/home.dart';
import './pages/product.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State {
  final List<Map<String, dynamic>> _products = [];

  void _deleteProduct(index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);              
    });
  }

  void _updateProduct(Map<String, dynamic> product, int index) {
    setState(() {
      _products[index] = product;              
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.lightBlueAccent
      ),
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/product_manager': (BuildContext context) => ProductManager(_addProduct, _updateProduct, _products),
        '/list': (BuildContext context) => HomePage(_products, _addProduct, _deleteProduct),
      },
      onGenerateRoute: ((RouteSettings settings) {
        final List<String> routeElement = settings.name.split('/');
        if(routeElement[0] != '') {
          return null;
        }
        if(routeElement[1] == 'product') {
          final int index = int.parse(routeElement[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(_products[index])
          );
        }
        return null;
      }),
      onUnknownRoute: ((RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) => ProductManager(_addProduct, _updateProduct, _products));
      }),
    );
  }
}
