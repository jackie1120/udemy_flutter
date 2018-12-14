import 'package:flutter/material.dart';
import './home.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login in'),
      ),
      body: Center(
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
