import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Firestore.instance.collection('users');
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Papi?"),
      ),
      body: new UnitList(),
    );
  }
}

class UnitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('kUnitList').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new GridView.count(
          crossAxisCount: 4,
          children: snapshot.data.documents.map((document) {
            return new GridTile(
                child: new Card(
                    color: Colors.blue.shade200,
                    child: new Center(
                      child: new Text(document['name'] ?? 'Doesnt exist'),
                    )
                )

            );
          }).toList(),
        );
      },
    );
  }
}

