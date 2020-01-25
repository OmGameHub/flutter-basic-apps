import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User Login",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(title: "User Login"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  String messageText = "";
  var messageColor = Colors.green;

  void checkUserAuth() {
    String email = emailController.text.trim();
    String pass = passController.text.trim();

    setState(() 
    {

      if(email.isEmpty || pass.isEmpty) 
      {
        messageText = "All fields are required";
        messageColor = Colors.red;
      }
      else if (email == "om@gmail.com") 
      {
        if (pass == "1234") 
        {
          messageText = "login successful";
          messageColor = Colors.green;
        } 
        else 
        {
          messageText = "invalid password";
          messageColor = Colors.red;
        } 
      } 
      else 
      {
        messageText = "invalid email";
        messageColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 32, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Icon(
                      Icons.casino,
                      size: 120,
                      color: Colors.white,
                    ),

                    Text(
                      "casino",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(height: 30,),

                    TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white)
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),

                    Padding(padding: const EdgeInsets.all(10)),

                    TextField(
                      controller: passController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white)
                      ),
                      obscureText: true,
                    ),

                    Padding(padding: const EdgeInsets.all(20)),

                    Container(
                      width: double.infinity,
                      child: MaterialButton(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            width: 2, 
                            color: Colors.white,
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: checkUserAuth,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(64),
                      child: Text(
                        messageText,
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold,
                          color: messageColor,
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}