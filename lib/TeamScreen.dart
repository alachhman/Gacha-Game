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
            return _displayGridItem(value, context);
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


  Widget _displayGridItem(String value, BuildContext context) {
    return new GestureDetector(
      onDoubleTap: (){
        showDialog(
          context: context,
          child: UnitInfoCard(value)
        );
      },
      child: new Card (
        margin: new EdgeInsets.all(5.0),
        color: Colors.blue,
        child: new Image.asset(value),
        elevation: 5,
      ),
    );
  }

  Widget UnitInfoCard(String value){
    String unitNameTemp = value.substring(value.indexOf("/",0)+1,value.indexOf(".",0));
    String firstLetter = unitNameTemp.substring(0,1).toUpperCase();
    String unitName = firstLetter + unitNameTemp.substring(1, unitNameTemp.length);
    int unitATK = 0;
    int unitDEF = 0;
    int unitSPD = 0;
    return Card(
      //color: Colors.grey,
      elevation: 20,
      margin: EdgeInsets.fromLTRB(70, 220, 70, 157),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child:
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child:RichText(
                    text: TextSpan(
                      text: unitName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ) ,
                ),
              ],
            ),
            Divider(
              height: 2,
              color: Colors.black,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(value),
                ),
                Container(
                  height: 149,
                  width: 0.5,
                  color: Colors.black,
                  margin: const EdgeInsets.only(right: 10.0),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                RichText(
                                    text: TextSpan(
                                      text: "ATK: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.black
                                      ),
                                    )
                                ),
                                RichText(
                                    text: TextSpan(
                                      text: "DEF: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.black
                                      ),
                                    )
                                ),
                                RichText(
                                    text: TextSpan(
                                      text: "SPD: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.black
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(unitATK.toString()),
                                Text(unitDEF.toString()),
                                Text(unitSPD.toString()),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                      child: Column(
                        children: <Widget>[
                          Image.asset("assets/gui/wind.png"),
                          Image.asset("assets/gui/sabre.png"),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              height: 2,
              color: Colors.black,
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: 
                    Row(
                      children: <Widget>[
                        Image.asset("assets/skillIcons/attackBuff.png"),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(5),
                              child:RichText(
                                text: TextSpan(
                                  text: 'Atk +20%',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child:RichText(
                                text: TextSpan(
                                  text: 'Atk +20% for 10 seconds.',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black
                                  ),
                                ),
                              ) ,
                            ),
                          ],
                        )
                      ],
                    ),
                ),
                Divider(
                  height: 2,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child:
                  Row(
                    children: <Widget>[
                      Image.asset("assets/skillIcons/windBlast.png"),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(5),
                            child:RichText(
                              text: TextSpan(
                                text: 'Wind Blast',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black
                                ),
                              ),
                            ) ,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child:RichText(
                              text: TextSpan(
                                text: 'Minor wind damage per tick.',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black
                                ),
                              ),
                            ) ,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(
              height: 2,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Enhance"),
                  onPressed: (){
                    //enhance dialog box method call here
                  },
                ),
                RaisedButton(
                  child: Text("Evolve"),
                  onPressed: (){
                    //evolve dialog box method call here
                  },
                )
              ],
            )
          ],
        ),
    );
  }
// Note: Placeholder method to generate grid data
  List<String> _generateGridItems() {
    List<String> gridItems = new List<String>();
    for (int i = 0; i < unitPool.length; i++) {
      print(unitPool[i]);
      String toAdd = unitPool[i].substring(26,unitPool[i].length-1);
      gridItems.add(toAdd);
    }
    if(unitPool.length == 0) {
      _query();
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

  // Function runs if pool is not empty and needs to add units
  void _comparitiveQuery() async {
    final id =  await dbHelper.queryRowCount();
    if(unitPool != [] || unitPool != null) {
      if (unitPool != tempPool)
        unitPool = tempPool;
    }
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
