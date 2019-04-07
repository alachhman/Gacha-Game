import 'package:flutter/material.dart';
import 'MainScreen.dart';
import 'auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class LoginScreen extends StatelessWidget {
  bool loggedIn = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
            children: [
          //background picture
          Container(
              height: 800,
             decoration: BoxDecoration(
                  color: Color(0xFF1F2041),
/*                  /*image: DecorationImage(
                    //image: AssetImage("assets/placeholder.png"),
                    //fit: BoxFit.fill,
                  ) */
*/              )
          ),
          //Button for card spawn
          Align(
              alignment: Alignment(0, .75),
              child: RaisedButton(
                  child: const Text('Press to Begin'),
                  elevation: 6.0,
                  color: Color(0xFF4B3F72),
                  splashColor: Color(0xFF4B3F72),
                  onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => Card(//this is the card that the log in goes
                    margin: EdgeInsets.fromLTRB(20, 300, 20, 150),
                      color: Color(0xFF4B3F72),
                      child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment(0, -.33),
                            child: Container(
                                height: 45,
                                width: 225,
                                child: SignInButton(
                                Buttons.Google,
                                text: "Sign in with Google",
                                onPressed: () {
                                  authService.googleSignIn();
                                  loggedIn = true;
                                }
                            )
                          )
                        ),
                        Align(
                          alignment: Alignment(0, .33),
                            child: Container(
                              height: 45,
                              width: 225,
                            child: RaisedButton(
                                child: const Text('Continue'),
                                color: Color(0xFF1F2041),
                                onPressed: () {
                                  if (loggedIn = true) {
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (
                                              context) => new MainScreen()),
                                    );
                                  }
                                }
                            )
                            )
                        )
                      ],
                    )

                  )
              );
               },
              )
          )
        ]
        )
    );
  }
}