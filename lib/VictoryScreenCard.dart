import 'package:flutter/material.dart';


class VictoryScreenCard extends StatelessWidget {
  bool vicCon;
  var victoryString = 'Victory';
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(0xFF1F2041),
        margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: new Stack(
          children: <Widget>[
            Align(
                alignment: Alignment(0, 0),
                child: Container(
                    color: Color(0xFF4B3F72),
                    height: 655,
                    width: 355,
                    child: new Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment(0, -.85),
                              child: Text(victoryString,
                                style: TextStyle(
                                    fontFamily: 'JosefinSans',
                                    fontSize: 42,
                                    fontWeight: FontWeight.w700
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment(0, 0),
                              child: Container(
                                  height: 40,
                                  width: 335,
                                  child: new InputDecorator(
                                      decoration: new InputDecoration(
                                          labelText: 'XP',
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white),
                                          ),
                                          labelStyle: new TextStyle(
                                              color: Colors.yellow)
                                      )
                                  )
                              )
                          ),
                          Align(
                              alignment: Alignment(0, -.5),
                              child: Container(
                                  height: 40,
                                  width: 335,
                                  child: new InputDecorator(
                                      decoration: new InputDecoration(
                                          labelText: 'Emeralis',
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white),
                                          ),
                                          labelStyle: new TextStyle(
                                              color: Colors.green)
                                      )
                                  )
                              )
                          ),
                          Align(
                              alignment: Alignment(0, .85),
                              child: RaisedButton(
                                  child: const Text('Continue'),
                                  color: Color(0xFF1F2041),
                                  onPressed: () {}
                              )
                          )
                        ]
                    )
                )
            )
          ],
        )
    );
  }
}