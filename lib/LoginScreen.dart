import 'package:flutter/material.dart';
import 'MainScreen.dart';
import 'login.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(children: [
          //background picture
          Container(
              height: 800,
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage("assets/placeholder.png"),
                    fit: BoxFit.fill,
                  ))),
          //Button for card spawn
          Align(
              alignment: Alignment(0, .75),
              child: RaisedButton(
                  child: const Text('Login'),
                  elevation: 6.0,
                  color: Color(0xFF4B3F72),
                  splashColor: Color(0xFF4B3F72),
                  onPressed: () {
                    authService.googleSignIn();
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MainScreen()),
                    );
                  }
              ),

//              showDialog(
//                  context: context,
//                  builder: (BuildContext context) => Card(//this is the card that the log in goes
//                      margin: EdgeInsets.fromLTRB(20, 200, 20, 150),
//                      color: Colors.white,
//                      child: Stack(
//                      children: <Widget>[
//                        Align(
//                            alignment: Alignment(0,-.50),
//                            child: Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
//                                child: new TextField(
//                              decoration: new InputDecoration(
//                                labelText: 'Username'
//                              ),
//                          )
//                          )
//                        ),
//                        Align(
//                            alignment: Alignment(0,.05),
//                            child: Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
//                                child: new TextField(
//                                  decoration: new InputDecoration(
//                                      labelText: 'Password'
//                                  ),
//                                )
//                            )
//                        ),
//                        //this is the log in button
//                        Align(
//                            alignment: Alignment(-.5, .65),
//                            child: RaisedButton(
//                                child: const Text('Login'),
//                                color: Colors.green,
//                                elevation: 5.0,
//                                onPressed: () {
//                                  Navigator.push(
//                                    context,
//                                    new MaterialPageRoute(
//                                        builder: (context) => new MainScreen()),
//                                  );
//                                }
//                            )
//                        ),
//                        Align(
//                            alignment: Alignment(.5, .65),
//                            child: RaisedButton(
//                                child: const Text('Forgot Password'),
//                                color: Colors.red,
//                                elevation: 5.0,
//                                onPressed: null
//                            )
//                        )
//                      ],
//                    )
//
//                  )
//              );
//            },

          ),
          RaisedButton(
              child: const Text('Logout'),
              elevation: 6.0,
              color: Color(0xFF4B3F72),
              splashColor: Color(0xFF4B3F72),
              onPressed: () {
                authService.signOut();
              }
          )
        ]
        )
    );
  }
}