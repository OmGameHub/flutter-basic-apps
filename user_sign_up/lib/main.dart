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

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController confirmPassController = new TextEditingController();

  String messageText = "";
  var messageColor;

  void checkUserAuth() {
    String name = emailController.text.trim();
    String phone = emailController.text.trim();
    String email = emailController.text.trim();
    String pass = passController.text;
    String confirmPass = confirmPassController.text;

    setState(() {
      if (!name.isEmpty && !phone.isEmpty && !email.isEmpty && !pass.isEmpty && !confirmPass.isEmpty) 
      {
        if (pass == confirmPass) 
        {
          messageText = "create new user successful";
          messageColor = Colors.green;
        } 
        else 
        {
          messageText = "password not match";
          messageColor = Colors.red;
        } 
      } 
      else 
      {
        messageText = "all fields are required";
        messageColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 32, right: 10),
              child: Column(
                children: <Widget>[

                  Icon(
                    Icons.fastfood,
                    size: 75,
                  ),

                  Container(height: 8),

                  Text(
                    "fast food",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Container(height: 32),

                  TextField(
                    controller: nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Color(0xffEAF0F1))
                    ),
                    keyboardType: TextInputType.text,
                  ),

                  Padding(padding: const EdgeInsets.all(8)),

                  TextField(
                    controller: phoneController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Phone',
                      labelStyle: TextStyle(color: Color(0xffEAF0F1))
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  Padding(padding: const EdgeInsets.all(8)),

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
                      labelStyle: TextStyle(color: Color(0xffEAF0F1))
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  Padding(padding: const EdgeInsets.all(8)),

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
                      labelStyle: TextStyle(color: Color(0xffEAF0F1))
                    ),
                    obscureText: true,
                  ),

                  Padding(padding: const EdgeInsets.all(8)),

                  TextField(
                    controller: confirmPassController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Color(0xffEAF0F1))
                    ),
                    obscureText: true,
                  ),

                  Padding(padding: const EdgeInsets.all(16)),

                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.transparent,
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.white, width: 2),
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20)
                      ),
                      onPressed: checkUserAuth,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(64),
                    child: Text(
                      messageText,
                      style: TextStyle(
                        fontSize: 14, 
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
    );
  }
}