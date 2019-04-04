
import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {

  FriendScreen();
  @override
  Widget build(BuildContext context) {
    var card = new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Text("UNIT HERE"),
            title: new Text("PlayerName"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("Player Level"),
          ),
          new Divider(color: Colors.blue,indent: 16.0,),
          new ListTile(
            leading: new Text("UNIT2 HERE"),
            title: new Text("PlayerName2"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("Player2 Level"),
          ),
          new Divider(color: Colors.blue,indent: 16.0,),
          new ListTile(
            leading: new Text("UNIT3 HERE"),
            title: new Text("PlayerName3"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("Player3 Level"),
          ),
          new Divider(color: Colors.blue,indent: 16.0,),
          new ListTile(
            leading: new Text("UNIT4 HERE"),
            title: new Text("PlayerName4"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("Player4 Level"),
          ),
          new Divider(color: Colors.blue,indent: 16.0,),
          new RaisedButton(
            child: const Text('Add Niggas!'),
            color: Colors.black,

          ),
        ],
      ),
    );

    return new Scaffold(

      body: card,
    );

  }
}
