import 'package:flutter/material.dart';
import 'package:jfinalproject/database_helper.dart';


class TeamScreenWidget extends StatelessWidget {
  List<String> unitPool=[];
  List<String> tempPool=[];
  final dbHelper = DatabaseHelper.instance;
  Widget build(BuildContext context) {
    Widget team = new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children:<TextSpan>[
                          TextSpan(
                              text: 'Team:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )
                          ),
                        ]
                    )
                ),
              ]
          ),
          Row (
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
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children:<TextSpan>[
                          TextSpan(
                              text: 'Your Unit Pool:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )
                          ),
                        ]
                    )
                ),
              ]
          ),
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
        team,
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
    return new Card (
      margin: new EdgeInsets.all(5.0),
      color: Colors.blue,
      child: new Image.asset(value),
      elevation: 5,
    );
  }

// Note: Placeholder method to generate grid data
  List<String> _generateGridItems() {
    _query();
    List<String> gridItems = new List<String>();
    for (int i = 0; i < unitPool.length; i++) {
      print(unitPool[i]);
      String toAdd = unitPool[i].substring(26,unitPool[i].length-1);
      gridItems.add(toAdd);
    }
    return gridItems;
  }
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('querying all rows');
    allRows.forEach((row) => {
        unitPool.add(row.toString())
    });
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.columnName : ' ',
      DatabaseHelper.columnSprite  : " "
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }
}
