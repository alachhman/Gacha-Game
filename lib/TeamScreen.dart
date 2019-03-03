import 'package:flutter/material.dart';

class TeamScreenWidget extends StatelessWidget {
  TeamScreenWidget();

  Widget build(BuildContext context) {
    Widget subtitle = new Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
      Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.red,
      width: 135.0,
      height:150.0,
    ),
        Container(
        padding: const EdgeInsets.all(8.0),
    color: Colors.blue,
    width: 135.0,
    height:150.0,
    ),
    Container(
    padding: const EdgeInsets.all(8.0),
    color: Colors.green,
    width: 135.0,
    height:150.0,
    )
    ]
    );


    Widget gridSection = new Expanded(
      flex: 1,
      child: new GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: _generateGridItems().map((String value) {
            return _displayGridItem(value);
          }).toList()),
    );

    Widget body = new Column(
      // This makes each child fill the full width of the screen
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        subtitle,
        gridSection,
      ],
    );

    return new Scaffold(
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: body,
      ),
    );
  }


  Widget _displayGridItem(String value) {
    return new Container (
      padding: new EdgeInsets.all(8.0),
      color: Colors.blue,
      child: new Text(value),
    );
  }


// Note: Placeholder method to generate grid data
  List<String> _generateGridItems() {
    List<String> gridItems = new List<String>();
    for (int i = 0; i < 24; i++) {
      gridItems.add('Unit ' + i.toString());
    }
    return gridItems;
  }
}