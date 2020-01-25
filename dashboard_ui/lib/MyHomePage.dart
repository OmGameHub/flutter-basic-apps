import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isDarkThemeEnable = false;

  void onChanged(bool value)
  {
    setState(() { isDarkThemeEnable = value; });

    DynamicTheme.of(context).setThemeData(
      isDarkThemeEnable? ThemeData.dark() : ThemeData.light()
    );

  }

  Widget courses(text, imageName, colors) => 
  Expanded(
    child: Stack(
      children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: colors,
            ),
          ), 
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ),
          ),         
        ),

        Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(8),
          child: Image(
            height: 75,
            image: AssetImage('assets/$imageName'),
          ),
        ),

      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[

              Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Image(
                      height: 300,
                      image: AssetImage('assets/school.png'),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Coding \nSchool",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Switch(
                          value: isDarkThemeEnable,
                          onChanged: onChanged , 
                        )

                      ],
                    ),
                  ),

                ],
              ),

              Container(height: 10),

              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          courses(
                            "HTML",
                            'html.png',
                            [
                              Color(0xFF0A79DF), 
                              Color(0xFF00a5f8), 
                              Color(0xFF00c7d5), 
                              Color(0xFF00df84), 
                              Color(0xFFa8eb12)
                            ],
                          ),

                          Container(width: 16),

                          courses(
                            "Dart",
                            'dart.png',
                            [
                              Color(0xFF3498db), 
                              Color(0xFF00aee3), 
                              Color(0xFF00c2e4), 
                              Color(0xFF39d5e1), 
                              Color(0xFF67e6dc)
                            ]
                          ),
                          
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          courses(
                            "Flutter",
                            'flutter.png',
                            [Colors.blue, Colors.purple],
                          ),
                          Container(width: 16),
                          courses(
                            "Android",
                            'android.png',
                            [
                              Color(0xFF8b78e6), 
                              Color(0xFF009dff), 
                              Color(0xFF00b6f1), 
                              Color(0xFF00c5b8), 
                              Color(0xFF2ecc72)
                            ]
                          ),
                          
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          courses(
                            "React",
                            'react.png',
                            [Color(0xFF00b0ff), Color(0xFF455a64)],
                          ),

                          Container(width: 16),
                          courses(
                            "Python",
                            'python.png',
                            [
                              Color(0xFF3498db), 
                              Color(0xFF888cdb), 
                              Color(0xFFc17dc5), 
                              Color(0xFFe2739f), 
                              Color(0xFFea7773), 
                              Color(0xFFf57f17)
                            ]
                          ),
                          
                        ],
                      ),
                    ),

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