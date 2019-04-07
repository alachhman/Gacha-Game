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
              alignment: FractionalOffset.topLeft,
              child: IconButton(
                  icon: Icon(Icons.mail),
                  onPressed: () {
                    return null;
                  }
              ),
            ),
          ),
          new Positioned(
            child: new Align(
                alignment: FractionalOffset.topCenter,
              child: IconButton(
                  icon: Icon(Icons.cake),
                  onPressed: null,
              ),
            ),
          ),
          new Positioned(
              child: new Align(
                alignment: FractionalOffset.topRight,
                child: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: null
                ),
              )
          )
        ],
      ),
    );
  }//Foundation
}//HomeScreenWidget

