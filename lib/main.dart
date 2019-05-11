import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController celsiusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();

  void _resetFields() {
    celsiusController.text = "";
    fahrenheitController.text = "";
  }

  void _converter() {
    double celsius = double.parse(celsiusController.text);
    double fahrenheit = celsius * 1.8 + 32.0;
    fahrenheitController.text = fahrenheit.toStringAsFixed(4);
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("Conversor de Temperatura"),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: _resetFields,
        )
      ],
    );

    Icon icon = Icon(Icons.wb_sunny, size: 120, color: Colors.yellow,);

    TextStyle styleDecoration_first = TextStyle(color: Colors.blueAccent, fontSize: 20);
    TextStyle styleDecoration_second = TextStyle(color: Colors.amberAccent, fontSize: 20);
    TextStyle styleField = TextStyle(color: Colors.blueAccent);

    RaisedButton raisedButton = RaisedButton(
      onPressed: _converter,
      child: Text("Calcular"),
      color: Colors.blueAccent,
    );

    Container containerBtn = Container(
      height: 200.0,
      child: raisedButton,
    );

    Padding padding = Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: containerBtn,
    );

    TextField tempCelsius = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Temperatura em graus Celsius",
        labelStyle: styleDecoration_first,
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: celsiusController,
    );

    TextField tempFahrenheit = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Temperatura em graus Fahrenheit",
        labelStyle: styleDecoration_second,
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: fahrenheitController,
    );

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        icon,
        tempCelsius,
        tempFahrenheit,
        padding,
      ],
    );

    SingleChildScrollView singleChildScrollView = SingleChildScrollView(
      child: column,
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: singleChildScrollView,
    );

    return scaffold;
  }
}


