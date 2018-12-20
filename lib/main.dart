import 'package:flutter/material.dart';
import './pages/auth.dart';
import './pages/product_manager.dart';
import './pages/home.dart';
import './pages/product.dart';
import 'package:scoped_model/scoped_model.dart';
import './scoped_model/products.dart';

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
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductsModel>(
      model: ProductsModel(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.lightBlueAccent
        ),
        // home: AuthPage(),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/product_manager': (BuildContext context) => ProductManager(),
          '/list': (BuildContext context) => HomePage(),
        },
        onGenerateRoute: ((RouteSettings settings) {
          final List<String> routeElement = settings.name.split('/');
          if(routeElement[0] != '') {
            return null;
          }
          if(routeElement[1] == 'product') {
            final int index = int.parse(routeElement[2]);
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(index)
            );
          }
          return null;
        }),
        onUnknownRoute: ((RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) => ProductManager());
        }),
      ),
    );
  }
}
