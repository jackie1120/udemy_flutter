import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product.dart';
import '../model/user.dart';

mixin ConnectedProducts on Model {
  List<Product> products = [];
  User authenticatedUser;
  int selectedProductIndex;

  void addProduct(String title, String description, String imageUrl, double price) {
    final Map<String, dynamic> productData = {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'userEmail': authenticatedUser.email,
      'userId': authenticatedUser.id
    };
    http.post('https://flutter-products-bba51.firebaseio.com/products.json', 
      body: json.encode(productData))
      .then((http.Response response) {
        print(response.statusCode);
        final Map<String, dynamic> responseData = json.decode(response.body);
        final product = Product(
          id: responseData['name'],
          title: title,
          description: description,
          imageUrl: 'https://images3.alphacoders.com/177/177739.jpg',
          price: price,
          userEmail: authenticatedUser.email,
          userId: authenticatedUser.id
        );
        products.add(product);
        selectedProductIndex = null;
        notifyListeners();
      })
      .catchError((error) {
        print(error);
      });
  }
}