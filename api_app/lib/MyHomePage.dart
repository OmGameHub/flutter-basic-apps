import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var url = 'http://userapi.tk/';
  List data = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<String> getData() async 
  {
    var response = await http.get(Uri.encodeFull(url));

    setState(() {
      var converted = json.decode(response.body);
      data = converted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api App"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) { 
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[index]['ImageURL']),
            ),
            title: Text(data[index]['Name']),
          );
        },
      ),
    );
  }
}