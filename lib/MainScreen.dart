import 'package:flutter/material.dart';
import 'SummonScreen.dart';
import 'PlayScreen.dart';
import 'TeamScreen.dart';
import 'PlaceholderWidget.dart';
import 'HomeScreen.dart';
import 'appbar.dart';
import 'login.dart';
import 'auth.dart';
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
    SummonScreenWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // here the desired height
         child: AppBarWidget(),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
        canvasColor: const Color(0xFF1F2041)
        ),
        child: BottomNavigationBar(
        type:  BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        //double iconSize: 24.0,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: Color(0xFF4B3F72),
            ),
            title: Text('Home',
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.w700
              )
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
              color: Color(0xFF4B3F72),
            ),
            title: Text('Team',
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.w700
              )
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.colorize,
              color: Color(0xFF4B3F72),
            ),
            title: Text('Play',
                style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w700
                )
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add,
                color: Color(0xFF4B3F72),
              ),
              title: Text('Summon',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.w700
                  )
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add,
                color: Color(0xFF4B3F72),
              ),
              title: Text('Friends',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.w700
                  )
              )
          )
        ],
      ),
    )
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}