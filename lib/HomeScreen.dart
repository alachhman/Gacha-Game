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
                  icon: Icon(Icons.public),
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
                    builder: (BuildContext context) =>
                    new Card(
                        color: Color(0xFF4B3F72),
                        margin: EdgeInsets.fromLTRB(20, 300, 20, 150),
                        child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment(0, -.92),
                                  child: Container(
                                      height: 50,
                                      width: 350,
                                      color: Color(0xFF1F2041),
                                      child: Align(
                                          alignment: Alignment(0, 0),
                                          child: const Text(
                                            'Debug',
                                            style: TextStyle(
                                              fontFamily: 'JosefinSans',
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                      )
                                  )
                              ),
                              Align(
                                  alignment: Alignment(.5, 0),
                                  child: new RaisedButton(
                                      child: Text("Emeralis"),
                                      color: Colors.green,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                            new Card(
                                              color: Color(0xFF4B3F72),
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 125, 20, 100),
                                              child: new Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                  ),
                                                  Align(
                                                      alignment: Alignment(0,-.96),
                                                      child: Container(
                                                          height:50,
                                                          width: 350,
                                                          color: Color(0xFF1F2041),
                                                          child: Align(
                                                              alignment: Alignment(0,0),
                                                              child: const Text(
                                                                'Debug',
                                                                style: TextStyle(
                                                                  fontFamily: 'JosefinSans',
                                                                  fontSize: 22,
                                                                  fontWeight: FontWeight.w700,
                                                                ),
                                                              )
                                                          )
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0,20,0,0),
                                                  ),
                                              Container(
                                                      height: 45,
                                                      width: 100,
                                                      color: Colors.green,
                                                      child: new RaisedButton(
                                                          child: Text(
                                                              "+1 Emeralis"),
                                                          color: Colors.green,
                                                          onPressed: null
                                                      )
                                                  ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                    ),
                                                    Container(
                                                        height: 45,
                                                        width: 100,
                                                        color: Colors.green,
                                                        child: new RaisedButton(
                                                            child: Text(
                                                                "+10 Emeralis"),
                                                            color: Colors.green,
                                                            onPressed: null
                                                        )
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                    ),
                                                    Container(
                                                        height: 45,
                                                        width: 100,
                                                        color: Colors.green,
                                                        child: new RaisedButton(
                                                            child: Text(
                                                                "+100 Emeralis"),
                                                            color: Colors.green,
                                                            onPressed: null
                                                        )
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                    ),
                                                    Container(
                                                        height: 45,
                                                        width: 100,
                                                        color: Colors.green,
                                                        child: new RaisedButton(
                                                            child: Text(
                                                                "+250 Emeralis"),
                                                            color: Colors.green,
                                                            onPressed: null
                                                        )
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                    ),
                                                    Container(
                                                        height: 45,
                                                        width: 100,
                                                        color: Colors.green,
                                                        child: new RaisedButton(
                                                            child: Text(
                                                                "+500 Emeralis"),
                                                            color: Colors.green,
                                                            onPressed: null
                                                        )
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                    ),
                                                    Container(
                                                        height: 45,
                                                        width: 100,
                                                        color: Colors.green,
                                                        child: new RaisedButton(
                                                            child: Text(
                                                                "+1000 Emeralis"),
                                                            color: Colors.green,
                                                            onPressed: null
                                                        )
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                    ),
                                                    Container(
                                                        height: 45,
                                                        width: 100,
                                                        color: Colors.green,
                                                        child: new RaisedButton(
                                                            child: Text(
                                                                "5000 Emeralis"),
                                                            color: Colors.green,
                                                            onPressed: null
                                                        )
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                    ),
                                                    Container(
                                                        height: 45,
                                                        width: 100,
                                                      color: Colors.green,
                                                      child: new RaisedButton(
                                                          child: Text(
                                                              "+10000 Emeralis"),
                                                          color: Colors.green,
                                                          onPressed: null
                                                      )
                                                  ),

                                                ],
                                              ),
                                            )
                                        );
                                      }
                                  )
                              ),
                              Align(
                                  alignment: Alignment(-.5, 0),
                                  child: new RaisedButton(
                                      child: Text("Gold"),
                                      color: Colors.yellow,
                                      onPressed: (){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) => new Card(
                                              color: Color(0xFF4B3F72),
                                              margin: EdgeInsets.fromLTRB(20, 125, 20, 100),
                                              child: new Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                  ),
                                                  Align(
                                                      alignment: Alignment(0,-.96),
                                                      child: Container(
                                                          height:50,
                                                          width: 350,
                                                          color: Color(0xFF1F2041),
                                                          child: Align(
                                                              alignment: Alignment(0,0),
                                                              child: const Text(
                                                                'Debug',
                                                                style: TextStyle(
                                                                  fontFamily: 'JosefinSans',
                                                                  fontSize: 22,
                                                                  fontWeight: FontWeight.w700,
                                                                ),
                                                              )
                                                          )
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0,20,0,0),
                                                  ),
                                                  Container(
                                                      height: 45,
                                                      width: 100,
                                                      color: Colors.yellow,
                                                      child: new RaisedButton(
                                                          child: Text(
                                                              "+1 Gold"),
                                                          color: Colors.green,
                                                          onPressed: null
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                  ),
                                                  Container(
                                                      height: 45,
                                                      width: 100,
                                                      color: Colors.yellow,
                                                      child: new RaisedButton(
                                                          child: Text(
                                                              "+10 Gold"),
                                                          color: Colors.green,
                                                          onPressed: null
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                  ),
                                                  Container(
                                                      height: 45,
                                                      width: 100,
                                                      color: Colors.yellow,
                                                      child: new RaisedButton(
                                                          child: Text(
                                                              "+100 Gold"),
                                                          color: Colors.green,
                                                          onPressed: null
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                  ),
                                                  Container(
                                                      height: 45,
                                                      width: 100,
                                                      color: Colors.yellow,
                                                      child: new RaisedButton(
                                                          child: Text(
                                                              "+250 Gold"),
                                                          color: Colors.green,
                                                          onPressed: null
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                  ),
                                                  Container(
                                                      height: 45,
                                                      width: 100,
                                                      color: Colors.yellow,
                                                      child: new RaisedButton(
                                                          child: Text(
                                                              "+500 Gold"),
                                                          color: Colors.green,
                                                          onPressed: null
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                  ),
                                                  Container(
                                                      height: 45,
                                                      width: 100,
                                                      color: Colors.yellow,
                                                      child: new RaisedButton(
                                                          child: Text(
                                                              "+1000 Gold"),
                                                          color: Colors.green,
                                                          onPressed: null
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                  ),
                                                  Container(
                                                      height: 45,
                                                      width: 100,
                                                      color: Colors.yellow,
                                                      child: new RaisedButton(
                                                          child: Text(
                                                              "+5000 Gold"),
                                                          color: Colors.green,
                                                          onPressed: null
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0,8,0,0),
                                                  ),
                                                  Container(
                                                      height: 45,
                                                      width: 100,
                                                      color: Colors.yellow,
                                                      child: new RaisedButton(
                                                          child: Text(
                                                              "+10000 Gold"),
                                                          color: Colors.green,
                                                          onPressed: null
                                                      )
                                                  ),

                                                ],
                                              ),
                                            )
                                        );
                                      }
                                  )
                              ),
                           ]
                        )
                       )
                    ,);
                }
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
                            margin: EdgeInsets.fromLTRB(20, 300, 20, 150),
                          child: Stack(
                              children:[
                                Align(
                                  alignment: Alignment(0,-.92),
                                  child: Container(
                                    height:50,
                                    width: 350,
                                    color: Color(0xFF1F2041),
                                      child: Align(
                                        alignment: Alignment(0,0),
                                         child: const Text(
                                          'Settings',
                                          style: TextStyle(
                                            fontFamily: 'JosefinSans',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                          ),
                                     )
                                      )
                                  )
                                ),
                                Align(
                            alignment: Alignment(0,.2),
                              child: Container(
                                  height: 45,
                                  width: 225,
                                  color: Colors.red,
                                  child: new RaisedButton(
                                      color: Colors.red,
                                      child: const Text(
                                                'Log Out',
                                              style: TextStyle(
                                              fontFamily: 'JosefinSans',
                                              fontWeight: FontWeight.w700,
                              ),
                            ),
                              onPressed: () {
                              authService.signOut();
                              runApp(
                                  new MaterialApp(
                                    debugShowCheckedModeBanner: false,
                                    home: new LoginScreen(),
                                  )
                              );
                            }
                            )
                          )
                          )
                        ]
                          )
                        ),
                    );
                  },
                ),
              ),
          Align(
              alignment: Alignment(0,0),
              child: IconButton(
                  icon: new Image.asset('assets/chrom.png'),
                  iconSize: 250,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => new Card(
                          color: Color(0xFF4B3F72),
                          margin: EdgeInsets.fromLTRB(20, 125, 20, 100),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0,8,0,0),
                              ),
                              Align(
                              alignment: Alignment(0,-.96),
                              child: Container(
                                  height:50,
                                  width: 350,
                                  color: Color(0xFF1F2041),
                                  child: Align(
                                      alignment: Alignment(0,0),
                                      child: const Text(
                                        'How to Play',
                                        style: TextStyle(
                                          fontFamily: 'JosefinSans',
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                  )
                              )
                          ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0,8,0,0),
                              ),
                    Text(
                        'In Menu:',
                    style: new TextStyle(
                    fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w700,
                    )
                    ),
                              Text(
                                      'Home: a place to learn info about the game, log out, or read news'
                                      ,
                                  style: new TextStyle(
                                    fontSize: 16.0, color: Colors.white,
                                  )
                              ),
                              Text(
                                      'Team: Aseemble your characters and view their attributes. Hold to drag them into a team slot or double tap to view their attributes'
                                  ,
                                  style: new TextStyle(
                                    fontSize: 16.0, color: Colors.white,
                                  )
                              ),
                              Text(
                                      'Play: Select what level you want to play and bring your friend'
                                  ,
                                  style: new TextStyle(
                                    fontSize: 16.0, color: Colors.white,
                                  )
                              ),
                              Text(
                                      'Summon: Exchange your saved up currency to gain new characters. You can get them in batches of 10 or one at a time.'
                                  ,
                                  style: new TextStyle(
                                    fontSize: 16.0, color: Colors.white,
                                  )
                              ),
                              Text(
                                      'Friend: Add or manage your IRL/Online friends.'
                                  ,
                                  style: new TextStyle(
                                    fontSize: 16.0, color: Colors.white,
                                  )
                              ),
                              Text(
                                  'In Battle:',
                                  style: new TextStyle(
                                    fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w700,
                                  )
                              ),
                              Text(
                                      '- Once you have made your team and started a level, your characters will take over',
                                  style: new TextStyle(
                                    fontSize: 16.0, color: Colors.white,
                                  )
                              ),
                              Text(
                                      '-If you wan tot keep track of the action, you can monitor the ATB gauge at the bottom of the screen.',
                                  style: new TextStyle(
                                    fontSize: 16.0, color: Colors.white,
                                  )
                              ),
                              Text(
                                      '-You will lose if all of your characters HP falls to 0.',
                                  style: new TextStyle(
                                    fontSize: 16.0, color: Colors.white,
                                  )
                              ),

                          ]
                          )//
                        )
                    );
                  }
              )
          ),
        ],
      ),
    );
  }
}
