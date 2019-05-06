import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'LoginScreen.dart';
import 'auth.dart';


class HomeScreenWidget extends StatelessWidget {
  bool vicCon;
  var victoryString = 'Victory';
  HomeScreenWidget();

  Widget build(BuildContext context) {
    return Scaffold(
      body: homeScreen(context),
    );
  }

  Widget homeScreen(BuildContext context) {
    return Container(
      color: Color(0xFF4B3F72),
      height: 650,
      child: new Stack(
        children: <Widget>[
          Align(
              alignment: Alignment(-.975,-.975),
              child: IconButton(
                  icon: new Image.asset('assets/skillIcons/Swipe.png'),
                  onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => new Container(
                        height:600,
       //                 child:  TweetWebView.tweetID('463440424141459456'),
                      )
                  );
                }
              )
          ),
          Align(
              alignment: Alignment(-.7,-.975),
              child: IconButton(
                icon: Icon(Icons.cake),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => new Card(
                        color: Color(0xFF4B3F72),
                        margin: EdgeInsets.fromLTRB(20, 125, 20, 100),
                        child: new Column(
                          children: <Widget>[
                            new ListTile(
                              leading: new Text("username"),
                              title: new Text("gift recieved"),
                              subtitle: new Text("From UserName2"),
                            ),
                          ],
                        ),
                      )
                  );
                },
              ),
          ),
              new Align(
                alignment: Alignment(.975,-.975),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => new Card(
                          color: Color(0xFF4B3F72),
                          margin: EdgeInsets.fromLTRB(20, 125, 20, 100),
                          child: new RaisedButton(
                            color: Colors.green,
                            child: const Text(
                              'The spectacle before us was indeed sublime',
                              style: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            onPressed: () {
                              authService.signOut();// GOTCHU JASON BABY
                              //crashes app
                              runApp(
                                  new MaterialApp(
                                    debugShowCheckedModeBanner: false,
                                    home: new LoginScreen(),
                                  )

                              );
                            }
                          ),
                        )
                    );
                  },
                ),
              ),
          Align(
              alignment: Alignment(0,0),
              child: IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => new Card(
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
                                            alignment: Alignment(0,-.85),
                                            child: Text(victoryString,
                                              style: TextStyle(
                                                  fontFamily: 'JosefinSans',
                                                  fontSize: 42,
                                                  fontWeight: FontWeight.w700
                                              ),
                                            )
                                        ),
                                        Align(
                                          alignment: Alignment(0,0),
                                        child: Container(
                                            height: 40,
                                            width:335,
                                            child: new InputDecorator(
                                      decoration: new InputDecoration(
                                          labelText: 'XP',
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(color: Colors.white),
                                          ),
                                          labelStyle: new TextStyle(color: Colors.yellow)
                                      )
                                         )
                                        )
                                     ),
                                        Align(
                                      alignment: Alignment(0,-.5),
                                       child: Container(
                                            height: 40,
                                            width:335,
                                           child: new InputDecorator(
                                            decoration: new InputDecoration(
                                                labelText: 'Emeralis',
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(color: Colors.white),
                                                ),
                                                labelStyle: new TextStyle(color: Colors.green)
                                            )
                                        )
                                        )
                                        ),
                                        Align(
                                          alignment: Alignment(0,.85),
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
                        )
                    );
                  }
              )
          )
        ],
      ),
    );
  }
}
//if (vicCon = true) {
//      victoryString = 'Victory';
//    }
//    else{
//      victoryString = 'Failure';
//    }   THIS CODE IS FOR THE FINAL IMPLEMENTATION