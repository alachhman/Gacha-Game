import 'package:flutter/material.dart';

class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget();


  Widget build(BuildContext context) {
      return Scaffold(
      body: Foundation()// put fucking widgets here,
    );
  }

  Widget Foundation(){
    return Container(
      color: Color(0xFF4B3F72),
      height: 650,
      child: new Stack(
        //alignment:new Alignment(x, y)
        children: <Widget>[
          new Positioned(
            child: new Align(
              alignment: FractionalOffset.topCenter,
              //
              //replace this child with top banner code
              //
              child: Text("hello"),
            ),
          ),
          new Positioned(
            child: new Align(
                alignment: FractionalOffset.bottomCenter,
                //
                //replace this child with bottom banner code
                //
                child: Text("Hello")
            ),
          )
        ],
      ),
    );
  }
} //stlss widget

