import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//TODO: Get units UNIQUE to user
//TODO: Finish Login and generate users
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Papi?"),
      ),
      body: new EventList(),
    );
  }
}

class EventList extends StatefulWidget {
  @override
  EventListState createState() => new EventListState();
}
//Below streams the database and grabs my collection 'kUnitList'
class EventListState extends State<EventList> {
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('kUnitList').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: const Text('Loading events...'));
        }
        return GridView.builder(
            itemCount: snapshot.data.documents.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Column(
                      children:[
                        Text(snapshot.data.documents[index]['name']),
                        Text('Current exp: ' + snapshot.data.documents[index]['CurrEXP'].toString()),
                        Text('Unit ID: ' + snapshot.data.documents[index]['UnitID'].toString()),
                        Text('Unit Type: ' + snapshot.data.documents[index]['type'].toString())
                      ],
                    )

                  ],
                ),
              );
            }
        );
      },
    );}}



    //Leave this for future Reference

//class EventList extends StatefulWidget {
//  @override
//  EventListState createState() => new EventListState();
//}
//
//class EventListState extends State<EventList> {
//  Widget build(BuildContext context) {
//    return StreamBuilder(
//      stream: Firestore.instance.collection('kUnitList').snapshots(),
//      builder: (BuildContext context, AsyncSnapshot snapshot) {
//        if (!snapshot.hasData) {
//          return Center(child: const Text('Loading events...'));
//        }
//        return GridView.builder(
//          gridDelegate:
//          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//          itemBuilder: (BuildContext context, int index) {
//            return Text(snapshot.data.documents[index]['name']);
//          },
//          itemCount: snapshot.data.documents.length,
//        );
//      },
//    );}}
