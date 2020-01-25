import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  File _image;

  Future onPressCamera() async
  {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future onPressGallery() async
  {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select image'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[

                GestureDetector(
                  child: Text(
                    'Open camera',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onTap: onPressCamera,
                ),

                Container(height: 8,),

                GestureDetector(
                  child: Text(
                    'Open gallery',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onTap: onPressGallery,
                ),
                
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Camera",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Camera"),
        ),
        body: Center(
          child: _image == null ? 
            Text("No Image") : Image.file(_image, fit: BoxFit.fill,),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera, color: Colors.white,),
          onPressed: _neverSatisfied,
        ),
      ),
    );
  }
}