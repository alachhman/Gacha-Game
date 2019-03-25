import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


//Class for userEnergy
class getUserLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading data');
        return Text(snapshot.data.documents[2]['Level'].toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 24,
        ),);
      },
    );
  }
}

class getUserEmeralis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading data');
        return Text(snapshot.data.documents[2]['Emeralis'].toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),);
      },
    );
  }
}

//Class to get userName
class getUserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading data');
        return Text(snapshot.data.documents[2]['Name'].toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 16,
        ),);
      },
    );
  }
}

class getUserGold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading data');
        return Text(snapshot.data.documents[2]['Gold'].toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),);
      },
    );
  }
}


//Doesnt work yet
// class to the user's Units
// Firestore.instance.collection('todo_list').where('status', isEqualTo: false).snapshots,
class GetUserUnits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading data');
        return Text(snapshot.data.documents[1]['userUnits'].toString());
      },
    );
  }

}
