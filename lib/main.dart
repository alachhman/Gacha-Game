import 'package:flutter/material.dart';
import 'Example.dart';
import 'child1.dart';
import 'gacha.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(),
    Placeholderexample(),
    gachaSys(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Placeholder"),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Units'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.colorize),
              title: Text('Battle')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.functions),
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


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}