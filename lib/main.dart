import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String ans = "0";

  String _ans = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed(String button){

    if(button == "clear"){
      _ans = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else if(button == "+" || button == "-" || button == "x" || button == "÷" ){
      num1 = double.parse(ans);
      operand = button;
      _ans = "0";
    }

    else if(button == "."){
      if(_ans.contains(".")){
        print("Already Contains .");
        return;
      }
      _ans += button;
    }

    else if(button == "(-)"){
      if(_ans.contains("-")){
        _ans = _ans.substring(1);
      }
      else{
        _ans = "-" + _ans;
      }
    }

    else if(button == "="){
      num2 = double.parse(ans);

      if(operand == "+"){
        _ans = (num1 + num2).toString();
      }
      else if(operand == "-"){
        _ans = (num1 - num2).toString();
      }
      else if(operand == "x"){
        _ans = (num1 * num2).toString();
      }
      else if(operand == "÷"){
        _ans = (num1 / num2).toString();
      }
      else{
        _ans = num2.toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else{
      _ans += button;
    }

    setState(() {

      ans = double.parse(_ans).toStringAsFixed(2);
    });

  }

  Widget buildButton(String text){
    return new Expanded(
      child: MaterialButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold
          )
        ),
        onPressed: () => {
          buttonPressed(text),
        },
        color: Colors.black38,
        textColor: Colors.white,
      )
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(

        child: new Column(children: <Widget>[

          new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child: new Text(
                ans,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                ),
              )
          ),

          new Expanded(
            child: new Divider()
          ),

          new Row(
            children: <Widget>[
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("÷")
            ],
          ),

          new Column(
            children: <Widget>[

              new Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("x")
                ],
              ),

              new Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ],
              ),

              new Row(
                children: <Widget>[
                  buildButton("0"),
                  buildButton("."),
                  buildButton("(-)"),
                  buildButton("+")
                ],
              ),

              new Row(
                children: <Widget>[
                  buildButton("clear"),
                  buildButton("=")
                ],
              ),
            ],
          ),

        ],)




      )





    );
  }
}
