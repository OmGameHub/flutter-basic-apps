import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: "Drum pad",
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

  void onPressPad(int num)
  {
    player.clearCache();
    switch (num) {
      case 1:
        player.play('one.mp3');
        break;
      case 2:
        player.play('two.mp3');
        break;
      case 3:
        player.play('three.mp3');
        break;
      case 4:
        player.play('four.mp3');
        break;
      case 5:
        player.play('five.mp3');
        break;
      case 6:
        player.play('six.mp3');
        break;
      case 7:
        player.play('seven.mp3');
        break;
      case 8:
        player.play('eight.mp3');
        break;
    }
  }

  Widget drumPad(int num) => 
  Expanded(
    child: Container(
      padding: EdgeInsets.all(10),
      child: MaterialButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () =>  onPressPad(num),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  drumPad(1),

                  drumPad(2),
                ],
              ),
            ),
            
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  drumPad(3),

                  drumPad(4),
                ],
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  drumPad(5),

                  drumPad(6),
                ],
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  drumPad(7),

                  drumPad(8),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}