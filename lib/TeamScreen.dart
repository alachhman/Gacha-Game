import 'package:flutter/material.dart';
import 'package:jfinalproject/UnitInfoCard.dart';
import 'package:jfinalproject/database_helper.dart';
import 'package:jfinalproject/TeamStore.dart';
import 'package:jfinalproject/Unit.dart';
import 'package:jfinalproject/LoadUnit.dart';
final dbHelper = DatabaseHelper.instance;
final teamHelper = TeamStore.instance;
class TeamScreenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => teamScreenState(this,[]);
}
class teamScreenState extends State<TeamScreenWidget>{
  List<String> unitPool=[];
  List<String> unitList = [];
  TeamScreenWidget teamScreenWidget;
  teamScreenState(this.teamScreenWidget, unitList);
  bool isLoaded = false;
  @override
  void initState(){
    super.initState();
    unitList = [];
    _query();
    _insert();
    loadUnit(units);
    getTeam();
  }
  final int unitCountInJson = 3;
  List<String> tempPool=[];
  List<Unit> units = new List();
  bool slot1Full = false;
  bool slot2Full = false;
  bool slot3Full = false;
  List<String> inTeam = ["0"," "," "," "];
  List<String> tempInTeam = [];
  Widget build(BuildContext context) {
    Widget team = new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0,8,0,0),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16,4,0,4),
                  child: RichText(
                      text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children:<TextSpan>[
                            TextSpan(
                                text: "Team:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )
                            ),
                          ]
                      )
                  ),
                ),
              ]
          ),
          Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Color(0xFF5C80BC),
                    width: 135.0,
                    height:150.0,
                    child: DragTarget(builder: (context, List<String> candidateData, rejectedData) {
                      return !slot1Full ? Container() :
                        Container(
                          child:GestureDetector(
                          onDoubleTap: (){
                            showDialog(
                              context: context,
                              child: UnitInfoCard(inTeam[1], units)
                            );
                          },
                          child: Image.asset(inTeam[1]),
                          )
                        );
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        _update(inTeam[1], inTeam[2], inTeam[3]);
                        setState(() {
                          slot1Full = true;
                          inTeam[1] = data;
                          print(inTeam[1] + " " + inTeam[2] + " " + inTeam[3]);

                        });
                      },
                    )
                ),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Color(0xFF5C80BC),
                    width: 135.0,
                    height:150.0,
                    child: DragTarget(builder: (context, List<String> candidateData, rejectedData) {
                      return !slot1Full ? Container() :
                      Container(
                          child:GestureDetector(
                            onDoubleTap: (){
                              showDialog(
                                  context: context,
                                  child: UnitInfoCard(inTeam[2], units)
                              );
                            },
                            child: Image.asset(inTeam[2]),
                          )
                      );
                    },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(() {
                          slot2Full = true;
                          inTeam[2] = data;
                          print(inTeam[1] + " " + inTeam[2] + " " + inTeam[3]);
                        });
                      },
                    )
                ),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Color(0xFF5C80BC),
                    width: 135.0,
                    height:150.0,
                    child: DragTarget(builder: (context, List<String> candidateData, rejectedData) {
                      return !slot1Full ? Container() :
                      Container(
                          child:GestureDetector(
                            onDoubleTap: (){
                              showDialog(
                                  context: context,
                                  child: UnitInfoCard(inTeam[3], units)
                              );
                            },
                            child: Image.asset(inTeam[3]),
                          )
                      );
                    },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(() {
                          slot3Full = true;
                          inTeam[3] = data;
                          print(inTeam[1] + " " + inTeam[2] + " " + inTeam[3]);
                        });
                      },
                    )
                ),
              ]
          ),
          Divider(
            height: 12,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8,8,0,0),
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
          Divider(
            height: 12,
            color: Colors.white,
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

    Widget body = new Container(
        height: 650,
        color: Color(0xFF4B3F72),
        child: new Column(
          // This makes each child fill the full width of the screen
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            team,
            gridSection,
          ],
        )
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
              child: UnitInfoCard(value, units)
          );
        },
        child: LongPressDraggable<String>(
            feedback: Image.asset(value),
            child: unitListCard(value),
            childWhenDragging: unitListCard(value),
            data:value
        )
    );
  }
  Card unitListCard(String value){
    return Card (
      margin: new EdgeInsets.all(5.0),
      color: Color(0xFF5C80BC),
      child: new Image.asset(value),
      elevation: 5,
    );
  }
// Note: Placeholder method to generate grid data
  List<String> _generateGridItems() {
    List<String> gridItems = new List<String>();
    if(unitList.length == 0) {
      _query();
      //refreshList();
    }
    for (int i = 0; i < unitList.length/2; i++) {
      String toAdd = unitList[i].substring(unitList[i].indexOf("assets/",0),unitList[i].length-1);
      gridItems.add(toAdd);
    }
    return gridItems;
  }
  void refreshList() async{
    setState(() {
      unitList = unitList;
    });
  }
  void _query() async {
    unitList = [];
    final allRows = await dbHelper.queryAllRows();
    print('querying all rows');
    allRows.forEach((row) => {
        unitList.add(row.toString())
    });
    setState(() {
      unitList = unitList;
    });
  }
  void getTeam() async {
    final allRows = await teamHelper.queryAllRows();
    print('querying Team');
    allRows.forEach((row) => {
        tempInTeam.add(row.toString()),
        print(tempInTeam),
        //print(row)
    });
    tempToReal();
    setState(() {
      inTeam = inTeam;
      if(inTeam[1] != " "){
       slot1Full = true;
      }
      if(inTeam[2] != " "){
        slot2Full = true;
      }
      if(inTeam[3] != " "){
        slot3Full = true;
      }
      print(inTeam);
    });
  }
  void tempToReal(){
    inTeam[0] = tempInTeam[tempInTeam.length].substring(tempInTeam[tempInTeam.length].indexOf("teamID: ",7),tempInTeam[tempInTeam.length].indexOf(", slot1:",0));
    inTeam[1] = tempInTeam[tempInTeam.length].substring(tempInTeam[tempInTeam.length].indexOf("slot1: ",6),tempInTeam[tempInTeam.length].indexOf(", slot2:",0));
    inTeam[2] = tempInTeam[tempInTeam.length].substring(tempInTeam[tempInTeam.length].indexOf("slot2: ",6),tempInTeam[tempInTeam.length].indexOf(", slot3:",0));
    inTeam[3] = tempInTeam[tempInTeam.length].substring(tempInTeam[tempInTeam.length].indexOf("slot3: ",6),tempInTeam[tempInTeam.length].indexOf("}",0));
  }
  void _delete() async {
    final id = await dbHelper.queryRowCount();

    for(int i = 0; i < unitList.length; i ++){
      final rowsDeleted = await dbHelper.delete(id);
      print('deleted $rowsDeleted row(s): row $id');
    }
  }
  void _deleteTeam() async {
    final id = await teamHelper.queryRowCount();

    for(int i = 0; i < unitList.length; i ++){
      final rowsDeleted = await teamHelper.delete(id);
      print('deleted $rowsDeleted row(s): row $id');
    }
  }
  void _update(String slot1, String slot2, String slot3) async {
    // row to update
    Map<String, dynamic> row = {
      TeamStore.Id : 0,
      TeamStore.columnSlot1 : slot1,
      TeamStore.columnSlot2 : slot2,
      TeamStore.columnSlot3 : slot3,
    };
    final rowsAffected = await teamHelper.update(row);
    print('updated $rowsAffected row(s)');
  }
  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      TeamStore.columnSlot1 : "1",
      TeamStore.columnSlot2 : "2",
      TeamStore.columnSlot3 : "3",
    };
    final id = await teamHelper.insert(row);
    print('inserted row id: $id');
  }
}
