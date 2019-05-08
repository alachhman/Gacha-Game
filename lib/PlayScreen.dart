import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jfinalproject/Unit.dart';
import 'package:jfinalproject/UnitInfoCard.dart';
import 'package:jfinalproject/LoadUnit.dart';

List<List<String>> templist = [["assets/units/chrom.png", "10" , "Waleed"]];
List<Unit> units = new List();
class PlayScreenWidget extends StatelessWidget {
  PlayScreenWidget();
  Widget build(BuildContext context) {
    loadUnit(units);
    return Scaffold(
      body: stages(context),
    );
  }
  Widget stages(BuildContext context){
    return Container(
        height: 650,
        color: Color(0xFF4B3F72),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index], context),
          itemCount: data.length,
        )
    );
  }
}
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.context);
  final Entry entry;

  final BuildContext context;
  Widget _buildTiles(Entry root) {
    String worldImage = "";
    switch(root.title){
      case "World 1": worldImage = "assets/backgrounds/world1BG.PNG"; break;
      case "World 2": worldImage = "assets/backgrounds/world2BG.png"; break;
      case "World 3": worldImage = "assets/backgrounds/world3BG.PNG"; break;
    }
    if (root.children.isEmpty) {
      return InkWell(
        child: ListTile(title: Text(root.title)),
        onTap: (){
          print(root.title);
          showDialog(
            context: context,
            child: friendsList(),
          );
        },
      );
    }
    return Card(
        child: Column(
          children: <Widget>[
            Image.asset(worldImage,
                fit: BoxFit.fitWidth
            ),
            ExpansionTile(
              key: PageStorageKey<Entry>(root),
              title: Text(root.title),
              children: root.children.map(_buildTiles).toList(),
            ),
          ],
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
Card friendsList(){
  return Card(
    elevation: 20,
    margin: EdgeInsets.fromLTRB(70, 175, 70, 175),
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
        ),
        RichText(
            text: TextSpan(
              text: "Choose a Friend",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black
              ),
            )
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, position){
            return friendsListItem(position, context);
          },
          itemCount: templist.length,
        )
      ],
    ),
  );
}
Card friendsListItem(int position, BuildContext context){
  String lvlText = "Lvl " + templist[position][1];
  const platform = const MethodChannel('samples.flutter.io/battle');
  Future<String> _launch() async{
    String value;
    try {
      value = await platform.invokeMethod('start');
    }on PlatformException catch(e) {
      print(e);
    }
    return value;
  }
  return Card(
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      height: 50,
      width: 50,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onDoubleTap: (){
              showDialog(
                  context: context,
                  child: UnitInfoCard(templist[position][0], units)
              );
            },
            child: Image.asset(templist[position][0]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
          ),
          RichText(
              text: TextSpan(
                text: lvlText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.black
                ),
              )
          ),
          RichText(
              text: TextSpan(
                text: templist[position][2],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.black
                ),
              )
          ),
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _launch,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
          ),
        ],
      ),
    ),
  );
}

final List<Entry> data = <Entry>[
  Entry(
    'World 1',
    <Entry>[
      Entry('Level 1'),
      Entry('Level 2'),
      Entry('Level 3'),
    ],
  ),
  Entry(
    'World 2',
    <Entry>[
      Entry('Level 1'),
      Entry('Level 2'),
    ],
  ),
  Entry(
    'World 3',
    <Entry>[
      Entry('Level 1'),
      Entry('Level 2'),
      Entry('Level 3'),
    ],
  ),
];