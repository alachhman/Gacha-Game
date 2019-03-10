import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


//Class for userEnergy
class getUserEnergy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading data');
        return Text(snapshot.data.documents[0]['Energy'].toString());
      },
    );
  }
}


//Class to get userName
class GetUserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading data');
        return Text(snapshot.data.documents[0]['Name'].toString());
      },
    );
  }
}


// class to the user's Units
// Firestore.instance.collection('todo_list').where('status', isEqualTo: false).snapshots,
class GetUserUnits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').where('name', isEqualTo: GetUserName()).snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading data');
//        List<String> theList;
//        for(var index = 0; index < snapshot.data.documents.length; index++) {
//            theList.add(snapshot.data.documents[0]['userUnits'].toString());
//            //print(theList[index]);
//        }
//        return Text(snapshot.data.documents[0]['userUnits'].toString());
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, int index) {
            Text(snapshot.data.documents[index]['userUnits']);
          },
        );

      },
    );
  }
}

// Generates the list of Units into a card view
class UnitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(child: new CircularProgressIndicator());
          default:
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, int) {
                  return Container(
                      child: Column(
                        children: <Widget>[
                          Text(snapshot.data.documents[int]['userUnits'].toString())
                        ],
                      )
                  );
                }
            );
        }
      },
    );
  }
}
