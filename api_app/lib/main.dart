import 'package:flutter/material.dart';

import 'MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Api App",
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}