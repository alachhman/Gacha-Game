import 'package:flutter/material.dart';
import 'SummonScreen.dart';
import 'PlayScreen.dart';
import 'TeamScreen.dart';
import 'PlaceholderWidget.dart';
import 'HomeScreen.dart';
class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreenWidget(),
    TeamScreenWidget(),
    PlayScreenWidget(),
    SummonScreenWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // here the desired height
        child: AppBar(
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
              )
              ,
          ),
          ]
        ),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type:  BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        //double iconSize: 24.0,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Team'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.colorize),
            title: Text('Play'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              title: Text('Summon')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}