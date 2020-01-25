import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Age calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

Widget datePicker(String titile, Color color, var dayController, var monthController, var yearController) => 
Row(
  children: <Widget>[
    Expanded(
      flex: 1,
      child: Text(
        titile, 
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color), 
        textAlign: TextAlign.center,
      ),
    ),

    Expanded(
      flex: 1,
      child: TextField(
        controller: dayController,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
        maxLength: 2,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'DD',
        ),
      ),
    ),

    Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text("/", style: TextStyle(fontSize: 24, color: color)),
    ),

    Expanded(
      flex: 1,
      child: TextField(
        controller: monthController,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
        maxLength: 2,
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'MM',
        ),
      ),
    ),

    Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text("/", style: TextStyle(fontSize: 24, color: color)),
    ),

    Expanded(
      flex: 1,
      child: TextField(
        controller: yearController,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
        maxLength: 4,
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'YYYY'
        ),
      ),
    ),

  ],
);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController dobDayController = TextEditingController();
  TextEditingController dobMonthController = TextEditingController();
  TextEditingController dobYearController = TextEditingController();

  TextEditingController nowDayController = TextEditingController();
  TextEditingController nowMonthController = TextEditingController();
  TextEditingController nowYearController = TextEditingController();

  String messageString = "";
  Color messageColor;

  void findAge()
  {
    try {
      if (
          dobDayController.text.isEmpty ||
          dobMonthController.text.isEmpty ||
          dobYearController.text.isEmpty ||

          nowDayController.text.isEmpty ||
          nowMonthController.text.isEmpty ||
          nowYearController.text.isEmpty
        ) 
      {
        setState(() 
        {
          messageColor = Colors.red;
          messageString = "All field are required";
        });

        return;
      }

      int birthDate = int.parse(dobDayController.text.trim());  
      int birthMonth = int.parse(dobMonthController.text.trim()); 
      int birthYear = int.parse(dobYearController.text.trim());
      
      int currentDate = int.parse(nowDayController.text.trim()); 
      int currentMonth = int.parse(nowMonthController.text.trim()); 
      int currentYear = int.parse(nowYearController.text.trim());

      List month = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; 


      if (
          (birthMonth <= 0 || birthMonth > 12) ||
          (currentMonth <= 0 || currentMonth > 12) 
        ) 
      {
        setState(() 
        {
          messageColor = Colors.red;
          messageString = "month can only between 1 to 12";
        });

        return;
      }

      if (
          (birthDate <= 0 || birthDate > month[birthMonth - 1]) ||
          (currentDate <= 0 || currentDate > month[currentMonth - 1])
        ) 
      {
        setState(() 
        {
          messageColor = Colors.red;
          messageString = "Invalid date";
        });

        return;
      }
    
      if (birthDate > currentDate) 
      { 
          currentDate = currentDate + month[birthMonth - 1]; 
          currentMonth = currentMonth - 1; 
      } 
    
      if (birthMonth > currentMonth) 
      { 
          currentYear = currentYear - 1; 
          currentMonth = currentMonth + 12; 
      } 
    
      int calculatedDate = currentDate - birthDate; 
      int calculatedMonth = currentMonth - birthMonth; 
      int calculatedYear = currentYear - birthYear;

      setState(() 
      {
        messageColor =Colors.purpleAccent;
        messageString = "Present Age Years: $calculatedYear  Months: $calculatedMonth  Days: $calculatedDate";
      });
    } 
    catch (e) 
    {
      print("Error message: $e");
      setState(() 
      {
        messageColor =Colors.red;
        messageString = "only natural number are allowed";
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Age calculator"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 16.0),
        child: Column(
          children: <Widget>[

            datePicker("DOB", Colors.purple[300], dobDayController, dobMonthController, dobYearController),

            Padding(padding: EdgeInsets.symmetric(vertical: 8)),

            datePicker("Now", Colors.purple[300], nowDayController, nowMonthController, nowYearController),

            Padding(padding: EdgeInsets.symmetric(vertical: 16)),

            Container(
              width: double.infinity,
              child: FlatButton(
                color: Colors.purple,
                textColor: Colors.white,
                padding: EdgeInsets.all(16.0),
                splashColor: Colors.purpleAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: findAge,
                child: Text(
                  "Flat Button",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),

            Padding(padding: EdgeInsets.symmetric(vertical: 24)),

            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                messageString,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: messageColor),
              ),
            ),

          ],
        ),
      ),
    );
  }
}