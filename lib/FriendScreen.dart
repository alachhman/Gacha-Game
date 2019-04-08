

import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {

  FriendScreen();
  @override
  Widget build(BuildContext context) {
    var card = new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Image.asset("assets/ayaka.png"),
            title: new Text("PlayerName"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("Player Level"),
          ),
          new Divider(color: Colors.black),
          new ListTile(
            leading: new Image.asset("assets/chrom.png"),
            title: new Text("PlayerName2"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("Player2 Level"),
          ),
          new Divider(color: Colors.black),
          new ListTile(
            leading: new Image.asset("assets/cherche.png"),
            title: new Text("PlayerName3"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("Player3 Level"),
          ),
          new Divider(color: Colors.black),
          new ListTile(
            leading: new Image.asset("assets/ayaka.png"),
            title: new Text("PlayerName4"
              ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("Player4 Level"),
          ),
          new Divider(color: Colors.black),
          new RaisedButton(
            child: const Text('Add Friends'),
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
