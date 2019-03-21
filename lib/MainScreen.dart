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
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("re:"),
        actions:[
          new IconButton(
            icon: new Image.asset('assets/images/icons/boop.png'),
            onPressed: () => print("icon pressed boi"),
          ),
        ],
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