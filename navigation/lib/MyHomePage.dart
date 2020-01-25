import 'package:flutter/material.dart';
import 'SecondPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Home Page"),

            MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                "Go to second page",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => SecondPage("om@gmail.com", "mypassword"))
                );
              },
            )

          ],
        ),
      ),
    );
  }
}