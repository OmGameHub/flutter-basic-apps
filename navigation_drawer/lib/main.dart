import 'package:flutter/material.dart';
import 'package:navigation_drawer/LoginPage.dart';
import 'MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nav 2",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/home': (context) => MyHomePage(),
      },
    );
  }
}