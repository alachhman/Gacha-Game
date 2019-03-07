import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeamScreenWidget extends StatelessWidget {
  TeamScreenWidget();

  Widget build(BuildContext context) {
    Widget unitcards = new Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.red,
            width: 135.0,
            height:150.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.blue,
            width: 135.0,
            height:150.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.green,
            width: 135.0,
            height:150.0,
          )
        ]
    );
    //====================================================================================================================

    Widget unitgrid = StreamBuilder(
      stream: Firestore.instance.collection('kUnitList').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: const Text('Loading events...'));
        }
        return GridView.builder(

            itemCount: snapshot.data.documents.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Column(
                      children:[
                        Text(snapshot.data.documents[index]['name']),
                        Text('Current exp: ' + snapshot.data.documents[index]['CurrEXP'].toString()),
                        Text('Unit ID: ' + snapshot.data.documents[index]['UnitID'].toString()),
                        Text('Unit Type: ' + snapshot.data.documents[index]['type'].toString())
                      ],
                    )

                  ],
                ),
              );
            }
        );
      },
    );




    //=====================================================================================================================

    /*   Widget gridSection = new Expanded(
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
*/
    Widget body = new Column(
      // This makes each child fill the full width of the screen
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        unitcards,
        unitgrid,
      ],
    );

    return new Scaffold(
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
        child: body,
      ),
    );
  }

/*
  Widget _displayGridItem(String value) {
    return new Card (
        margin: new EdgeInsets.all(5.0),
        child: new Text(value),
        elevation: 5,
        color: Colors.grey,
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
  */
}