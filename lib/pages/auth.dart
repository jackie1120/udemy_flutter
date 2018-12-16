import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login in'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.6), BlendMode.dstATop))),
        padding: EdgeInsets.all(10.0),
        child: Center(child:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                // autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Username/E-mail',
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (String value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Password', 
                    fillColor: Colors.white, 
                    filled: true),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  print(password);
                  print(username);
                  Navigator.pushReplacementNamed(context, '/product_manager');
                },
                child: Text('Login'),
              )
            ]
          ),
        ),) ,
      ),
    );
  }
}
