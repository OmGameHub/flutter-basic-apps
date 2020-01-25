import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var dices = [
    AssetImage("assets/dice1.png"),
    AssetImage("assets/dice2.png"),
    AssetImage("assets/dice3.png"),
    AssetImage("assets/dice4.png"),
    AssetImage("assets/dice5.png"),
    AssetImage("assets/dice6.png"),
  ];

  int index = 0;

  void onPressed() => setState(() { index = Random().nextInt(dices.length); });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dice roller",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: FlatButton(
            splashColor: Colors.transparent,  
            highlightColor: Colors.transparent,
            child: Image(
              width: 200,
              height: 200,
              image: dices[index],
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}