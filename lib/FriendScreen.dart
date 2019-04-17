import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {

  FriendScreen();


  final List<List<String>> cardInfo = [
    ["assets/cherche.png", "UserName1", "Level 1"],
    ["assets/chrom.png", "UserName2" ,"Level 1"],
    ["assets/ayaka.png", "UserName3", "Level 1"],
    ["assets/cherche.png", "Username4","Level 1"],
    ["assets/chrom.png", "Username5","Level 1"],
    ["assets/ayaka.png", "Username6","Level 1"],
    ["assets/cherche.png", "Username7","Level 1"],
  ];

  final List<List<String>> userLVL = [
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
      body: bannerList(),
    );
  }

  Widget bannerList() {
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

  Card friendcard(BuildContext context, int position) {
    return Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Image.asset(cardInfo[position][0]),
            title: new Text(cardInfo[position] [1]),
            subtitle: new Text(userLVL[position][0]),
          ),

        ],
      ),
    );
  }

}
