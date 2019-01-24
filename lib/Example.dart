import 'package:flutter/material.dart';

class Placeholderexample extends StatelessWidget {
  Placeholderexample();

  final List<String> sendersList = ["Area 1", "Area 2", "Area 3"];
  final List<String> subjectList = ["Battle 1", "Battle 2", "Battle 3"];

  Widget build(BuildContext context) {
    return Scaffold(
      body: email(),
    );
  }

  Widget email() {
    return ListView.builder(
        itemCount: sendersList.length,
        itemBuilder: (context, position){
          return InkWell(
            onTap: (){
              print("stage tapped");
            },
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                      child:Text(sendersList[position],
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                      )
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(0.8),
                          child:Icon(Icons.star_border),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.8),
                          child:Icon(Icons.star_border),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.8),
                          child:Icon(Icons.star_border),
                        ),
                      ],
                    ),
                    Divider(
                      height: 2.0,
                      color: Colors.black,
                    )
                  ],
                )
              ],
            ),
          );
        }
    );
  }
}