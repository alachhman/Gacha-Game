import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget();


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _AppBar()// put fucking widgets here,
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
                alignment: Alignment.bottomCenter,
                child:Row( //row for text of user info
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    Column( //left side
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('username: ' + 'speralta',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),

                        ),
                        //      Spacer(),
                        Text('level: ' + '10',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )),
                      ],
                    ),
                    Spacer(),
                    Column( //right
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:[
                          Text('diamonds: ' + '50',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              )
                          ),
                          //     Spacer(),
                          Text('gold: ' + 'reeee',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              )),
                        ]
                    )
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