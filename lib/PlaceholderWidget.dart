import 'package:flutter/material.dart';
import 'onlineDB.dart';
import 'login.dart';

//class PlaceholderWidget extends StatelessWidget {
//  final Color color;
//
//  PlaceholderWidget(this.color);
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        LoginButton(),
//        theUser(),
//      ]
//    );
//  }
//}

class PlaceHolderWidget extends StatefulWidget {


  @override
  _PlaceHolderWidget createState() => _PlaceHolderWidget();

}

class _PlaceHolderWidget extends State<PlaceHolderWidget> {
  Future initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          LoginButton(),
          theUser(),
        ]
    );
  }
}
