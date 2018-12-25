import 'package:scoped_model/scoped_model.dart';
import '../model/user.dart';
import './main.dart';

mixin UserModel {
  User _authenticatedUser;

  void login(String email, String password) {
    _authenticatedUser = User(id: 'asdjkfsd', email: email, password: password);
  }
}