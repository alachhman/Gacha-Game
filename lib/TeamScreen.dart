import 'package:flutter/material.dart';

class TeamScreenWidget extends StatelessWidget {
  TeamScreenWidget();

  Widget build(BuildContext context) {
    return Scaffold(
     body: _column(),
    );
  }
//this shit is wrong right here
  Widget _column() {
   return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children<Widget>[
       Row(
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.red,
          width: 135.0,
          height:150.0,
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.blue,
          width: 135.0,
          height:150.0,
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.green,
          width: 135.0,
          height:150.0,
        ))
      ]
    );

  }}