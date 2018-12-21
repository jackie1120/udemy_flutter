import 'package:scoped_model/scoped_model.dart';
import '../model/user.dart';
import './main.dart';

mixin UserModel on Model {
  User authenticateUser;
}