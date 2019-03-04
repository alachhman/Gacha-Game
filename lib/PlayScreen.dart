import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlayScreenWidget extends StatelessWidget {
  static const platform = const MethodChannel('samples.flutter.io/battle');
  PlayScreenWidget();

  final List<String> sendersList = ["Area 1", "Area 2", "Area 3"];
  final List<String> subjectList = ["Battle 1", "Battle 2", "Battle 3"];

  Widget build(BuildContext context) {
    return Scaffold(
      body: stages(),
    );
  }
  Future<String> _launch() async{
    String value;
    try {
      value = await platform.invokeMethod('start');
    }on PlatformException catch(e) {
      print(e);
    }
    return value;
  }

  Widget stages() {
    return ListView.builder(
        itemCount: sendersList.length,
        itemBuilder: (context, position){
          return InkWell(
            onTap: (){
              print("stage tapped");
              _launch();
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
                          padding: EdgeInsets.all(2),
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