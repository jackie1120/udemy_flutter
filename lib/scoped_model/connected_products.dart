import 'package:scoped_model/scoped_model.dart';
import '../model/product.dart';
import '../model/user.dart';

mixin ConnectedProducts on Model {
  List<Product> products = [];
  User authenticatedUser;
  int selectedProductIndex;

  void addProduct(String title, String description, String imageUrl, double price) {
    final product = Product(
      title: title,
      description: description,
      imageUrl: imageUrl,
      price: price,
      userEmail: authenticatedUser.email,
      userId: authenticatedUser.id
    );
    products.add(product);
    selectedProductIndex = null;
  }
}