import 'package:flutter/material.dart';

class PlayScreenWidget extends StatelessWidget {
  PlayScreenWidget();

  Widget build(BuildContext context) {
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
          EntryItem(data[index]),
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
  const EntryItem(this.entry);

  final Entry entry;

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