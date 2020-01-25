import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  String email;
  String password;

  SecondPage(this.email, this.password);

  @override
  _SecondPageState createState() => _SecondPageState(this.email, this.password);
}

class _SecondPageState extends State<SecondPage> {

  String email;
  String password;

  _SecondPageState(this.email, this.password);

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

            Text(
              "Email : $email", 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            Text(
              "Password : $password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            Padding(padding: EdgeInsets.all(10),),

            MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                "Go to back",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )

          ],
        ),
      ),
    );
  }
}