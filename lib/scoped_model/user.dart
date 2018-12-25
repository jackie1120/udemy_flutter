import '../model/user.dart';
import './connected_products.dart';

mixin UserModel on ConnectedProducts {

  void login(String email, String password) {
    authenticatedUser = User(
      id: 'sdfasd',
      email: email,
      password: password
    );
  }
}