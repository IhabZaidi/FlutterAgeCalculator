import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() => runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(primarySwatch: Colors.purple),
    home: new AgeCalculator()));

class AgeCalculator extends StatefulWidget {
  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  double age = 0;
  double selectedYear;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  double now = DateTime.now().year.toDouble();


  void calculateage() {
    age = now - selectedYear;
  }

  void showPicker() {
    showDatePicker(
            context: context,
            initialDate: new DateTime(1990),
            firstDate: new DateTime(1990),
            lastDate: DateTime.now())
        .then((DateTime dt) {
      setState(() {
        selectedYear = dt.year.toDouble();
        calculateage();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text("Simple Age Calculator App")),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new OutlineButton(
                child: Container(
                  child: Text(
                    'Select ur Birth Date from here',
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
                borderSide: new BorderSide(color: Colors.blue, width: 3.0),
                color: Colors.blue,
                onPressed: showPicker,
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
              ),
              new Text(
                "ur age is ${age.toStringAsFixed(0)} yrs",
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
      ),
    );
  }
}
