import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController yourNameController = new TextEditingController();
  TextEditingController crushNameController = new TextEditingController();

  String yourNameText = "";
  String crushNameText = "";
  double lovePercent = 0;

  bool isMessageShow = false;

  void calculateLove()
  {
    yourNameText = yourNameController.text.trim();
    crushNameText = crushNameController.text.trim();

    if (yourNameText.isEmpty || crushNameText.isEmpty) 
    {
      setState(() { isMessageShow = false; }); 
    }
    else
    {
      lovePercent = (Random().nextDouble() * 50) + 50;
      setState(() {
        yourNameText = yourNameText[0].toUpperCase() + yourNameText.substring(1);
        crushNameText = crushNameText[0].toUpperCase() + crushNameText.substring(1);

        lovePercent = double.parse(lovePercent.toStringAsFixed(2));
        isMessageShow = true;
      });
    }

    FocusScope.of(context).requestFocus(FocusNode());
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, 
            colors: [
              Colors.red, 
              Colors.pink, 
              Colors.purple,
              Colors.deepPurple,
            ], 
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 8, top: 42, right: 8),
          child: Column(
            children: <Widget>[

              Text(
                "The Love Calculator",
                style: TextStyle(
                  fontSize: 32, 
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(padding: const EdgeInsets.only(bottom: 32)),

              inputTextField("Your name", yourNameController),

              Padding(padding: const EdgeInsets.only(bottom: 16)),

              inputTextField("Crush name", crushNameController),

              Padding(padding: const EdgeInsets.only(bottom: 32)),

              // calculate love btn
              Container(
                width: double.infinity,
                child: FlatButton(
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.white, width: 2),
                  ),
                  child: Text(
                    'Calculate Love',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: calculateLove,
                ),
              ),

              Padding(padding: const EdgeInsets.only(bottom: 8)),

              Expanded(
                flex: 1,
                child: Visibility(
                  visible: isMessageShow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      nameText(yourNameText),

                      Padding(padding: const EdgeInsets.only(bottom: 8)),

                      Icon(
                        Icons.favorite,
                        size: 48,
                        color: Colors.white,
                      ),

                      Padding(padding: const EdgeInsets.only(bottom: 8)),

                      nameText(crushNameText),

                      Padding(padding: const EdgeInsets.only(bottom: 48)),

                      Text(
                        "$lovePercent%",
                        style: TextStyle(
                          fontSize: 48, 
                          color: Colors.white, 
                          fontWeight: 
                          FontWeight.bold
                        ),
                      ),

                      Text(
                        "Love is in the Air Drop",
                        style: TextStyle(
                          fontSize: 18, 
                          color: Colors.white, 
                          fontWeight: 
                          FontWeight.bold
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

Widget inputTextField(String labelText, TextEditingController controller) => 
  TextFormField(
    controller: controller,
    style: TextStyle(color: Colors.white),
    cursorColor: Colors.white,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white)
      ),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white)
    ),
  );

Widget nameText(String name) => 
  Text(
    name,
    style: TextStyle(
      fontSize: 24, 
      color: Colors.white, 
      fontWeight: 
      FontWeight.bold
    ),
  );
