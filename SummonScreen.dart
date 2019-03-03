import 'package:flutter/material.dart';



void main() => runApp(new Placeholder());

class PlaceholderWidget extends StatelessWidget {
  PlaceholderWidget();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home:new MyCard()
    );
  }
}
class MyCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Widget allcards;
    return new Scaffold(
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(280, 10, 0, 0),
                      child: new Row(
                        children: <Widget>[
                          new RaisedButton(
                              child: const Text('Button'),
                            onPressed: (){

                            },

                          ),
                        ],
                      ),


                    ),
                    new Image.network('https://educationusa.state.gov/sites/default/files/styles/content_area_full_width/public/field_hei_logo/nyit-logo-pms.jpg?itok=6yOYbJdd'),
                    new Padding(
                        padding: new EdgeInsets.fromLTRB(140, 0, 0, 35),
                        child: new Row(
                          children: <Widget>[
                            new RaisedButton(
                              child: const Text('Summon'),
                              color: Theme.of(context).accentColor,
                              elevation: 4.0,
                              splashColor: Colors.blueGrey,
                              onPressed: () {
                                showDialog(
                                    context:context,
                                  builder: (BuildContext context) => new Card(
                                    child: const Text("yftdtdhgjdghjdhgjdghjd"),

                                  ),
                                );
                              },
                            ),

                          ],
                        )
                    )
                  ],
                ),
              )
            ],
          ),

        )

    );

  }
}
