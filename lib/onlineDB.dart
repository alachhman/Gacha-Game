import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';



class getUserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          return StreamBuilder(
              stream: Firestore.instance.collection('users1').document(snapshot.data.uid).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                return Text(snapshot.data['displayName'].toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),);
              }
          );
        }
    );
  }
}


//Class for User Level
class getUserLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          return StreamBuilder(
              stream: Firestore.instance.collection('users1').document(snapshot.data.uid).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                return Text(snapshot.data['level'].toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),);
              }
          );
        }
    );
  }
}



//Class to get userName
class getUserEmeralis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          return StreamBuilder(
              stream: Firestore.instance.collection('users1').document(snapshot.data.uid).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                return Text(snapshot.data['emeralis'].toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),);
              }
          );
        }
    );
  }
}


class getUserGold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          return StreamBuilder(
              stream: Firestore.instance.collection('users1').document(snapshot.data.uid).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                return Text(snapshot.data['gold'].toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),);
              }
          );
        }
    );
  }
}


class getUserUnits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          return StreamBuilder(
              stream: Firestore.instance.collection('users1').document(snapshot.data.uid).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                return Text(snapshot.data['Unit List'].toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),);
              }
          );
        }
    );
  }
}
