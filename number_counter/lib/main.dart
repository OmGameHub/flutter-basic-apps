import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget 
{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var numList = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine",
    "Ten",
  ];

  var colorList = [
    Color(0xff1abc9c),
    Color(0xff2ecc71),
    Color(0xff3498db),
    Color(0xff9b59b6),
    Color(0xff45CE30),
    Color(0xffE74292),
    Color(0xff01CBC6),
    Color(0xff4C4B4B),
    Color(0xffEEC213),
    Color(0xffF5C469),
  ];

  Color randomColor = Colors.blue;

  int topNumIndex = 0;
  int bottomNumIndex = 0;

  int topColorIndex = 0;
  int bottomColorIndex = 0;

  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(
      Duration(seconds: 2), 
      (Timer timer) 
      {
        changeTop();
      }
    );
    super.initState();
  }

  @override
  void dispose() {
    print("dispose call");
    timer.cancel();
    super.dispose();
  }

  void changeTop() {
    setState(() {
      topNumIndex = Random().nextInt(colorList.length);
      topColorIndex = Random().nextInt(colorList.length);
    });

    int r = Random().nextInt(255);
    int g = Random().nextInt(255);
    int b = Random().nextInt(255);

    setState(() {
      randomColor = Color.fromARGB(255, r, g, b);
      // randomColor = Color.fromRGBO(r, g, b, 1);
    });
  }

  void changeBottom() {
    setState(() {
      bottomNumIndex = Random().nextInt(colorList.length);
      bottomColorIndex = Random().nextInt(colorList.length);
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Number counter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Number counter"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: randomColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        numList[topNumIndex],
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.white
                        ),
                      ),

                      Padding(padding: EdgeInsets.all(20)),

                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                        onPressed: () {},
                        child: Text(
                          "Change",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white, width: 4),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: colorList[bottomColorIndex],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        numList[bottomNumIndex],
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),

                      Padding(padding: EdgeInsets.all(20)),

                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                        onPressed: changeBottom,
                        child: Text(
                          "Change",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white, width: 4),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}