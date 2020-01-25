import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    
    return MaterialApp(
      title: "Piano",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static AudioCache player = AudioCache(prefix: 'audio/');

  Widget pianoWhiteKey(soundName) => 
  Container(
    height: double.infinity,
    width: 100,
    child: MaterialButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), 
          bottomRight: Radius.circular(20), 
        ),
      ),
      onPressed: () => player.play(soundName),
    ),
  );

  Widget pianoBlackKey(soundName) => 
  Container(
    height: double.infinity/2,
    width: 50,
    padding: EdgeInsets.only(bottom: 100),
    child: MaterialButton(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), 
          bottomRight: Radius.circular(20), 
        ),
      ),
      onPressed: () => player.play(soundName),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            children: <Widget>[
              
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    pianoWhiteKey('A.wav'),

                  ],
                ),
              ),
              
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    pianoWhiteKey('B.wav'),

                    pianoBlackKey('Bb.wav'),

                  ],
                ),
              ),
              
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    pianoWhiteKey('C.wav'),

                    pianoBlackKey('C1.wav'),

                  ],
                ),
              ),
              
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    pianoWhiteKey('D.wav'),

                    pianoBlackKey('D1.wav'),

                  ],
                ),
              ),
              
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    pianoWhiteKey('E.wav'),

                    pianoBlackKey('E1.wav'),

                  ],
                ),
              ),
              
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    pianoWhiteKey('F.wav'),

                    pianoBlackKey('F1.wav'),

                  ],
                ),
              ),
              
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    pianoWhiteKey('G.wav'),

                    pianoBlackKey('A.wav'),

                  ],
                ),
              ),

              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    pianoWhiteKey('B.wav'),

                    pianoBlackKey('Bb.wav'),

                  ],
                ),
              ),

              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    pianoWhiteKey('C.wav'),

                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}