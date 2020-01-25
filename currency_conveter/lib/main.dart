import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Currency Conveter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  TextEditingController inputController = TextEditingController();
  TextEditingController oututController = TextEditingController();

  var currencyList = [
    "DOLLAR",
    "EURO",
    "POUNDS",
    "AUS",
    "CANADA",
    "YEN",
    "DINAR",
    "BITCOIN",
    "RUBEL",
  ];

  var colorList = [
    Color(0xff1abc9c),
    Color(0xff2ecc71),
    Color(0xff3498db),
    Color(0xff9b59b6),
    Color(0xff45CE30),
    Color(0xffE74292),
    Color(0xff01CBC6),
    Color(0xff4C4B4B),
    Color(0xffEEC213),
  ];

  bool isErrorHit = false;

  void onPressBtn(String currencyName) {

    double inputAmount;
    double result = 0;

    if (inputController.text.isEmpty) {
      setState(() { 
        oututController.text = "Please enter amount";
        isErrorHit = true; 
      });
      return;
    } 
    

    try 
    {
      inputAmount = double.parse(inputController.text.trim());

      if (inputAmount < 0) 
      {
        setState(() { 
          oututController.text = "Please enter amount in natura naumber";
          isErrorHit = true; 
        });

        return;
      }
    } 
    catch (e) 
    {
      setState(() 
      { 
        oututController.text = "Please enter amount in number only";
        isErrorHit = true;
      });
      return;
    }

    switch(currencyName) 
    {
      case "DOLLAR": 
        result = inputAmount * 0.014;
        break;
      case "EURO": 
        result = inputAmount * 0.012;
        break;
      case "POUNDS": 
        result = inputAmount * 0.011;
        break;
      case "AUS": 
        result = inputAmount * 0.020;
        break;
      case "CANADA": 
        result = inputAmount * 0.018;
        break;
      case "YEN": 
        result = inputAmount * 1.52;
        break;
      case "DINAR": 
        result = inputAmount * 0.0042;
        break;
      case "BITCOIN": 
        result = inputAmount * 0.0000019;
        break;
      case "RUBEL": 
        result = inputAmount * 0.87;
        break;
    }

    setState(() {
      oututController.text = result.toString();
      isErrorHit = false;
    });
  }
  
  Widget currencyBtn(int btnIndex) {
    return(
      Expanded(
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          onPressed: () => onPressBtn(currencyList[btnIndex]),
          child: Text(
            currencyList[btnIndex],
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold, 
              color: Colors.white
            ),
          ),
          color: colorList[btnIndex],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: Colors.white, 
              width: 2
            ),
          ),
        ),
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAE0E2),
      appBar: AppBar(
        title: Text("Currency Conveter"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 32, right: 10, bottom: 32),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: inputController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter amount in INR'
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(10)),
                  
                  TextField(
                    controller: oututController,
                    enabled: false,
                    style: TextStyle(color: isErrorHit ? Colors.red : null),
                    decoration: InputDecoration(
                      hintText: 'Result'
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                children: <Widget>[
                  
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        currencyBtn(0),
                        currencyBtn(1),
                        currencyBtn(2),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        currencyBtn(3),
                        currencyBtn(4),
                        currencyBtn(5),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        currencyBtn(6),
                        currencyBtn(7),
                        currencyBtn(8),
                      ],
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}