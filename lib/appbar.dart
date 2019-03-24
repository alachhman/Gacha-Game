import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget();


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // here the desired height
          child: _AppBar()// put fucking widgets here,
    ),
    );
  }

  Widget _AppBar(){
      return AppBar(
        flexibleSpace:
        Column(
            children:[
              Container( //container for notif bar, make this change colors
                height: 24,
                color: Colors.white,
              ),
              Container(
                height: 80,
                alignment: Alignment.center,
                child: Stack(
                  //alignment:new Alignment(x, y)
                  children: <Widget>[
                    Positioned(
                      child: new Align(
                        alignment:  Alignment(-.92,-.57),
                        //
                        //USER INFORMATION
                        //
                        child: Text('username: ' + 'speralta',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                   Positioned(
                      child: Align(
                          alignment: Alignment(-.92,.57),
                          //
                          //LEVEL INFO STUFF
                          //
                          child: Text('level: ' + '10',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              )
                          )
                      ),
                    ),
                    Positioned(
                      child: new Align(
                        alignment: Alignment(.53,-.55),
                        //
                        //PREMIUM CURRENCY
                        //
                        child: Text('Emeralis: ' + '50',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      child: new Align(
                        alignment: Alignment(.49,.57),
                        //
                        //GOLD
                        //
                        child: Text('gold: ' + 'reeee',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(

                    image: DecorationImage(
                      image: AssetImage("assets/gui/appbar.png"),
                      fit: BoxFit.fill,
                    )
                ),
              ),
            ]
        ),
      );
  }
}