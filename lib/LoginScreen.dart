import 'package:flutter/material.dart';
import 'MainScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            height: 800,
            child: Align(
                alignment: Alignment.center,
                child: Checkbox(
                    value: false,
                    onChanged: (bool newValue) {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (ctxt) => new MainScreen()),
                      );
                    }
                )
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                  image: AssetImage("assets/placeholder.png"),
                  fit: BoxFit.fill,
                )
            )
        )
    );
  }
}
