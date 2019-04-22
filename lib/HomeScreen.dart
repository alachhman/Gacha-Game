import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'LoginScreen.dart';
import 'auth.dart';


class HomeScreenWidget extends StatelessWidget {
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
        ],
      ),
    );
  }
}