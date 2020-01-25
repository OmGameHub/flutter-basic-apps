import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[

            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  "Om", 
                  style: TextStyle(
                    fontSize: 20, 
                    color: Colors.white, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              accountName: Text("Om Prakash"),
              accountEmail: Text("om@gmail.com"),
              arrowColor: Colors.red,
              otherAccountsPictures: <Widget>[

                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    "Om", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    "Om", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

              ],
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pop(context),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {  },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {  },
            ),

            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {  },
            ),

            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Contact Us'),
              onTap: () {  },
            ),

            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text('Rate Us'),
              onTap: () {  },
            ),

          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Home Page"),

            MaterialButton(
              color: Colors.blue,
              child: Text("Login Page"),
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