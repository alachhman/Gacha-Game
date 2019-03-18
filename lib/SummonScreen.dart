import 'dart:math';

import 'package:flutter/material.dart';

import 'package:jfinalproject/database_helper.dart';

class SummonScreenWidget extends StatelessWidget {
  SummonScreenWidget();
  final dbHelper = DatabaseHelper.instance;
  final List<List<String>> bannerInfo = [
    ["assets/bannerimages/banner1.png","Banner1"],
    ["assets/bannerimages/banner1.png","Banner2"],
    ["assets/bannerimages/banner1.png","Banner3"],
  ];
  final List<String> multiResults = [];
  final List<String> pool = ["assets/cherche.png","assets/chrom.png"];
  bool isMulti = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: bannerList(),
    );
  }
  Widget bannerList(){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: bannerInfo.length,
      itemBuilder:(context, position){
        return banner(context, position);
      },
    );
  }
  Card banner(BuildContext context, int position){
    double maxWidth = MediaQuery.of(context).size.width;
    return Card(
      margin: new EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                child: new FlatButton(
                  color: Colors.blue,
                  child: Text("More Info"),
                  splashColor: Colors.blue,
                ),
                onTap: (){
                  print("More Info " + position.toString() + " Tapped");
                  showDialog(
                    context: context,
                    child: Dialog(context, position)
                  );
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth * 0.9),
                child: Image.asset(bannerInfo[position][0],
                fit: BoxFit.fill,
                )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("Summon 1"),
                color: Theme.of(context).accentColor,
                onPressed: (){
                  print("Summon " + position.toString() +  " Pressed");
                  showDialog(
                    context: context,
                    child: gachaResults(1),
                  );
                },
              ),
              RaisedButton(
                child: Text("Summon 10 + 1"),
                color: Theme.of(context).accentColor,
                onPressed: (){
                  isMulti = true;
                  print("Summon 10+1 " + position.toString() +  " Pressed");
                  Random rand = new Random();
                  for(int i = 0; i < 10; i++){
                    int result = rand.nextInt(pool.length);
                    String obtained = pool[result];
                    _insert("unit", obtained, 1);
                    if(isMulti){
                      multiResults.add(pool[result]);
                    }
                  }
                  showDialog(
                      context: context,
                      child: MultiResultDisplay()
                  );
                  isMulti = false;
                  multiResults.clear();
                },
              )
            ],
          )
        ],
      ),
      elevation: 20,
      color: Colors.white54,
    );
  }
  Card Dialog(BuildContext context, int position) {
    return Card(
        elevation: 20,
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Divider(
              color: Colors.black,
              height: 10,
            ),
            Text(bannerInfo[position][1]),
          ],
        )
    );
  }
  void _insert(String name, String sprite, int count) async {
    // row to insert
    for(int i = 0; i > count; i++){
      Map<String, dynamic> row = {
        DatabaseHelper.columnName : 'name',
        DatabaseHelper.columnSprite  : sprite
      };
      final id = await dbHelper.insert(row);
      print('inserted row id: $id');
    }
  }
  Card gachaResults(int count){
    Random rand = new Random();
    //unit rarity is hardcoded for now, will be finalized and dependant on the unit in the future.
    int starCount = rand.nextInt(5);
    int result = rand.nextInt(pool.length);
    String obtained = pool[result];
    if(isMulti){
      multiResults.add(pool[result]);
    }
    _insert("unit", obtained, count);
    return Card(
      elevation: 20,
      margin: EdgeInsets.fromLTRB(70, 220, 70, 300),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      child:
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgrounds/summonBackground.PNG"),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("You've Obtained",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(obtained)
                  ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset("assets/gui/star.png"),
                  new Image.asset("assets/gui/star.png"),
                  new Image.asset("assets/gui/star.png"),
                  new Image.asset("assets/gui/star.png"),
                  new Image.asset("assets/gui/star.png"),
                ],
              ),
            ],
          ),
        )
    );
  }
  Card MultiResultDisplay(){
    return Card(
        elevation: 20,
        margin: EdgeInsets.fromLTRB(50, 40, 40, 50),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child:
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgrounds/summonBackground.PNG"),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("You've Obtained",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(multiResults[0]),
                    Image.asset(multiResults[1])
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(multiResults[2]),
                    Image.asset(multiResults[3])
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(multiResults[4]),
                    Image.asset(multiResults[5])
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(multiResults[6]),
                    Image.asset(multiResults[7])
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(multiResults[8]),
                    Image.asset(multiResults[9])
                  ]
              ),
            ],
          ),
        )
    );
  }
}