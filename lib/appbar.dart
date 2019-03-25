import 'package:flutter/material.dart';
import 'onlineDB.dart';

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
                        alignment:  Alignment(-.60,0),
                        //
                        //USER INFORMATION
                        //
                        child: getUserName(),
                      ),
                    ),
                   Positioned(
                      child: Align(
                          alignment: Alignment(-.92,0),
                          //
                          //LEVEL INFO STUFF
                          //
                          child: getUserLevel(),
                      ),
                    ),
                    Positioned(
                      child: new Align(
                        alignment: Alignment(.34,-.49),
                        //
                        //PREMIUM CURRENCY
                        //
                        child: getUserEmeralis()
                      ),
                    ),
                    Positioned(
                      child: new Align(
                        alignment: Alignment(.40,.50),
                        //
                        //GOLD
                        //
                        child: getUserGold(),
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