import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


//Class for username
class getUserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          return StreamBuilder(
              stream: Firestore.instance.collection('users1').document(snapshot.data.uid).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if(!snapshot.hasData) {
                  return Text('Loading...');
                }
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
                if(!snapshot.hasData) {
                  return Text('Loading...');
                }
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
                if(!snapshot.hasData) {
                  return Text('Loading...');
                }
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

// Class for user gold
class getUserGold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          return StreamBuilder(
              stream: Firestore.instance.collection('users1').document(snapshot.data.uid).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if(!snapshot.hasData) {
                  return Text('Loading...');
                }
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

//Class for user Units from the DB
// Currently only pulls the array of units a user has
class getUserUnits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          return StreamBuilder(
              stream: Firestore.instance.collection('users1').document(snapshot.data.uid).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if(!snapshot.hasData) {
                  return Text('Loading...');
                }
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

// Generates Help Screen based off of friends list
class friendsHelper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          return StreamBuilder(
              stream: Firestore.instance.collection('users1').document(snapshot.data.uid).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                //return Text(snapshot.data['Friends'].toString(),
                if(!snapshot.hasData) return Text('Loading Data');
                return ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: snapshot.data['Friends'].length,
                  itemBuilder: (context, index) {
                    return buildItem(context, snapshot.data['Friends'][index]);
                  },
                );
              }
          );
        }
    );
  }

  // TODO: PRETTIFY THE PLAY SCREEN HELP LIST HERE
  Widget buildItem(context, String id) {
    return StreamBuilder(
        stream: Firestore.instance.collection('users1').document(id).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) return Text('Loading Data');
         // return Text(snapshot.data['displayName']);
          return new ListTile(
            title: Text(snapshot.data['displayName']),
            trailing:  Icon(Icons.keyboard_arrow_right),
            subtitle: (Text(snapshot.data['level'].toString())),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => new Card(
                    margin: EdgeInsets.fromLTRB(20, 120, 20, 350),
                    child: new Column(
                      children: <Widget>[
                        new RaisedButton(
                          child: new Text("Remove Friend"),
                          onPressed: null,
                          color: Color(0xFF4B3F72),
                        ),
                        new RaisedButton(
                          child: new Text("Send Gift"),
                          onPressed: null,
                          disabledColor: Color(0xFF4B3F72),

                        ),
                      ],
                    ),
                  )
              );            },
          );
        }
    );
  }
}
