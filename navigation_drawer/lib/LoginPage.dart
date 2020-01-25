import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Login Page"),

            MaterialButton(
              color: Colors.blue,
              child: Text("Home Page"),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            )

          ],
        ),
      ),
    );
  }
}