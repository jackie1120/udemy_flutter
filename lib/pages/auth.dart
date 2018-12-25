import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/main.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String email;
  String password;
  bool isKeepLogin = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width > 500.0 ?  MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width;
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
        child: Center(
          child:SingleChildScrollView(
            child: Form(
              key: _formkey,
              child:Container(
                width: width,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'E-mail',
                          fillColor: Colors.white,
                          filled: true),
                      validator: (String value) {
                        if(value.isEmpty || RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value)) {
                          return 'Email is required and must a valid address';
                        }
                      },
                      onSaved: (String value) {
                        email = value;
                      },
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password', 
                          fillColor: Colors.white, 
                          filled: true),
                      obscureText: true,
                      validator: (String value) {
                        if(value.isEmpty || value.trim().length < 8) {
                          return 'Password is required and should be 8+ charactors long';
                        }
                      }, 
                      onSaved: (String value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SwitchListTile(
                      value: isKeepLogin,
                      onChanged: (bool value) {
                        setState(() {
                          isKeepLogin = value;
                        });
                      },
                      title: Text('Keep login',style: TextStyle(color: Colors.white),),
                    ),
                    ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model) {
                      return RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          if(!_formkey.currentState.validate()) {
                            return;
                          }
                          _formkey.currentState.save();
                          print(password);
                          print(email);
                          model.login(email, password);
                          Navigator.pushReplacementNamed(context, '/product_manager');
                        },
                        child: Text('Login'),
                      );
                    },),
                  ]
                ),
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}
