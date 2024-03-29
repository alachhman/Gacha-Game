import 'package:flutter/material.dart';
import 'onlineDB.dart';
class FriendScreen extends StatelessWidget {
  FriendScreen();
  final List<List<String>> cardInfo = [
    ["assets/cherche.png", "UserName1"],
    ["assets/chrom.png", "UserName2"],
    ["assets/ayaka.png", "UserName3"],
    ["assets/cherche.png", "Username4"],
    ["assets/chrom.png", "Username5"],
    ["assets/ayaka.png", "Username6"],
    ["assets/cherche.png", "Username7"],
    ["assets/cherche.png", "UserName1"],
    ["assets/chrom.png", "UserName2"],
    ["assets/ayaka.png", "UserName3"],
    ["assets/cherche.png", "Username4"],
    ["assets/chrom.png", "Username5"],
    ["assets/ayaka.png", "Username6"],
    ["assets/cherche.png", "Username7"],
    ["assets/cherche.png", "UserName1"],
    ["assets/chrom.png", "UserName2"],
    ["assets/ayaka.png", "UserName3"],
    ["assets/cherche.png", "Username4"],
    ["assets/chrom.png", "Username5"],
    ["assets/ayaka.png", "Username6"],
    ["assets/cherche.png", "Username7"],
    ["assets/cherche.png", "UserName1"],
    ["assets/chrom.png", "UserName2"],
    ["assets/ayaka.png", "UserName3"],
    ["assets/cherche.png", "Username4"],
    ["assets/chrom.png", "Username5"],
    ["assets/ayaka.png", "Username6"],
    ["assets/cherche.png", "Username7"],
  ];
  final List<List<String>> userLVL = [
    ["Level 1", ""],
    ["Level 12", ""],
    ["Level 123", ""],
    ["Level 1234", ""],
    ["Level 12345", ""],
    ["Level 123456", ""],
    ["Level 1234567", ""],
    ["Level 1", ""],
    ["Level 12", ""],
    ["Level 123", ""],
    ["Level 1234", ""],
    ["Level 12345", ""],
    ["Level 123456", ""],
    ["Level 1234567", ""],
    ["Level 1", ""],
    ["Level 12", ""],
    ["Level 123", ""],
    ["Level 1234", ""],
    ["Level 12345", ""],
    ["Level 123456", ""],
    ["Level 1234567", ""],
    ["Level 1", ""],
    ["Level 12", ""],
    ["Level 123", ""],
    ["Level 1234", ""],
    ["Level 12345", ""],
    ["Level 123456", ""],
    ["Level 1234567", ""],
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:friendsHelper(),
        color: Color(0xFF4B3F72),
      ),
      floatingActionButton: friendButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
  Widget friendList() {
    return Container(
        color: Color(0xFF4B3F72),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cardInfo.length,
          itemBuilder: (context, position) {
            return friendcard(context, position);
          },
        )
    );
  }
  Widget friendButton(BuildContext context){
    return new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new FloatingActionButton(
          child: Icon(Icons.add,
              color: Colors.black),
          onPressed: (){
            showDialog(
                context: context,
                builder: (BuildContext context) => new Card(
                  margin: EdgeInsets.fromLTRB(20, 120, 20, 350),
                  child: new TextField(
                    autocorrect: true,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    cursorColor: Color(0xFF4B3F72),
                    cursorRadius: Radius.circular(16.0),
                    cursorWidth: 16.0,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.gamepad),
                      hintText: "search for friends here",
                      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF4B3F72)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
            );
          },
          elevation: 20.0,
          tooltip: "add friend",
          backgroundColor: Colors.white,
        )
      ],
    );
  }
  Card friendcard(BuildContext context, int position) {
    return Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Image.asset(cardInfo[position][0]),
            title: new Text(cardInfo[position] [1]),
            trailing: Icon(Icons.keyboard_arrow_right),
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
              );
            },
            onLongPress: (){
              print('tapped!!!');
            },
            subtitle: new Text(userLVL[position][0]),
          ),
        ],
      ),
    );
  }
}