import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
TODO 1: Update user classes when they sign and show information according to uid


 */

// This updates when user clicks sign into google and show's their UID
class theUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authService.user ,
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if(!snapshot.hasData)
            return Text('Loading');
          return Text(snapshot.data.uid);
        }
    );
  }
}

// Not working
// Testing to see if I can stream information after the user logs in
class getUE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('users1').where('uid', isEqualTo: theUser()).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData)
            return Text('Loading');
//       final userDocument = snapshot.data.documents[1];
//       return new Text(userDocument.toString());
        }

    );
  }
}



//Class for userEnergy
class getUserEnergy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading data');
        return Text(snapshot.data.documents[1]['Energy'].toString());
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
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading data');
        return Text(snapshot.data.documents[1]['userUnits'].toString());
      },
    );
  }
}