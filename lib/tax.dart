import 'package:flutter/material.dart';

class Tax extends StatefulWidget {
  @override
  _TaxState createState() => _TaxState();
}

class _TaxState extends State<Tax> {
  double tax = 0.0;
  String _weightStatus = "";
  final TextEditingController _nameField = new TextEditingController();
  final TextEditingController _tinField = new TextEditingController();
  final TextEditingController _incomeField = new TextEditingController();
  final TextEditingController _rateField = new TextEditingController();

  void _onClick() {
    setState(() {
      tax = calculate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text("Company Income Tax Calculator"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: new ListView(
        padding: EdgeInsets.only(top: 12.0),
        children: <Widget>[
          new Image.asset(
            "./images/bmilogo.png",
            alignment: Alignment.topCenter,
            height: 130.0,
            width: double.maxFinite,
          ),
          //tEXT fEILD
          new Container(
            //color: Colors.pink,
            padding: EdgeInsets.all(10.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  controller: _nameField,
                  decoration: InputDecoration(
                    icon: new Icon(Icons.person),
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "Enter Your Company Name",
                  ),
                  keyboardType: TextInputType.text,
                ),
                new TextField(
                  controller: _tinField,
                  decoration: InputDecoration(
                      icon: new Icon(Icons.table_chart),
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: "Enter Your Company TIN",
                      hintText: "xxxxxx"),
                  keyboardType: TextInputType.number,
                ),
                new TextField(
                  controller: _incomeField,
                  decoration: InputDecoration(
                      icon: new Icon(Icons.line_weight),
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: "Enter Your Company's Income for the Year",
                      hintText: "In Naira"),
                  keyboardType: TextInputType.number,
                ),
                new TextField(
                  controller: _rateField,
                  decoration: InputDecoration(
                      icon: new Icon(Icons.line_weight),
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: "tax rate ",
                      hintText: "In %"),
                  keyboardType: TextInputType.number,
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                new Center(
                  child: new RaisedButton(
                    child: new Text("Calculate"),
                    color: Colors.greenAccent,
                    onPressed: _onClick,
                    splashColor: Colors.greenAccent,
                  )
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                         tax > 0.0 ? "income tax liability for ${_nameField.text} is :N${tax.toStringAsFixed(2)}" : " ",
                        style: new TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  double calculate() {
    if (_incomeField.text.isNotEmpty && _rateField.text.isNotEmpty) {
      double income = double.parse(_incomeField.text);
      double rate = double.parse(_rateField.text);
      rate = rate / 100;
      return (income * rate);
    } else
      return 0.0;
  }
}