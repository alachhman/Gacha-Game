import 'package:flutter/material.dart';
import 'MainScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:new Stack(
          children:[
            //CHILD ONE
            Container(
                height: 800,
                decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                  image: AssetImage("assets/placeholder.png"),
                  fit: BoxFit.fill,
                )
              )
            ),
            //CHILD TWO
            Align(
              child: Container(
                height: 100,
                width: 100,
                color:Colors.green,
                alignment: Alignment.center,
                child: Checkbox(
                value: false,
                onChanged: (bool newValue) {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new MainScreen()),
                  );
                 }
                )
              )
            ),
          ]
        )
    );
  }
}
