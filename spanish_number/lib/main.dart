import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // add it to your class as a static member
  static AudioCache audioPlayer = AudioCache();

  void onPressNumber(String text)
  {
    switch (text) {
      case "One":
        audioPlayer.play('one.wav');
        break;
      case "Two":
        audioPlayer.play('two.wav');
        break;
      case "Three":
        audioPlayer.play('three.wav');
        break;
      case "Four":
        audioPlayer.play('four.wav');
        break;
      case "Five":
        audioPlayer.play('five.wav');
        break;
      case "Six":
        audioPlayer.play('six.wav');
        break;
      case "Seven":
        audioPlayer.play('seven.wav');
        break;
      case "Eight":
        audioPlayer.play('eight.wav');
        break;
      case "Nine":
        audioPlayer.play('nine.wav');
        break;
      case "Ten":
        audioPlayer.play('ten.wav');
        break;
    }

    print(text);
    
  }

  Widget numBtn(String text, Color color) => 
  Container(
    child: MaterialButton(
      height: 80,
      minWidth: 160,
      color: color,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(width: 2, color: Colors.white),
      ),
      onPressed: () { onPressNumber(text); },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spanish Number",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Spanish Number"),
        ),

        body: Center(
          child: Column(
            children: <Widget>[

              Image(
                height: 120,
                width: 120,
                image: AssetImage("assets/lco.png")
              ),

              Padding(padding: EdgeInsets.only(bottom: 24)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  numBtn("One", Colors.red),
                  numBtn("Two", Colors.blue),
                ],
              ),

              Padding(padding: EdgeInsets.only(bottom: 10)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  numBtn("Three", Colors.green),
                  numBtn("Four", Colors.amber),
                ],
              ),

              Padding(padding: EdgeInsets.only(bottom: 10)),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  numBtn("Five", Colors.purple),
                  numBtn("Six", Colors.teal),
                ],
              ),

              Padding(padding: EdgeInsets.only(bottom: 10)),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  numBtn("Seven", Colors.orange),
                  numBtn("Eight", Colors.indigo),
                ],
              ),

              Padding(padding: EdgeInsets.only(bottom: 10)),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  numBtn("Nine", Colors.cyan),
                  numBtn("Ten", Colors.blueGrey),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}