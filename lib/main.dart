import 'package:flutter/material.dart';
import 'localDatabase.dart';
import 'UnitList.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fuck Me Daddy',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Future initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new GetUserName(),
      ),
      body: Column(
        children: <Widget>[
          getUserEnergy(),
          GetUserUnits(),
          testLocalDB(),
        ],
      ),
    );
  }
}


