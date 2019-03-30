import 'package:flutter/material.dart';
import 'MainScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:new Stack(
          children:[
            //CHILD ONE
            Container(
                height: 800,
                decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                  image: AssetImage("assets/placeholder.png"),
                  fit: BoxFit.fill,
                )
              )
            ),
            //CHILD TWO
            Align(
                alignment: Alignment(0,.75),
                child: RaisedButton(
                 child: const Text('Login'),
                 elevation: 6.0,
                 color: Color(0xFF4B3F72),
                 splashColor: Color(0xFF4B3F72),
                     onPressed: () {
                       showDialog(
                         context: context,
                         child: Card(
                             margin: EdgeInsets.fromLTRB(20, 200, 20, 150),
                             color: Colors.white,
                             child: Align(
                                 alignment: Alignment(0,.65),
                                 child: RaisedButton(
                                     child: const Text('Namekian'),
                                         color: Colors.green,
                                         elevation: 5.0,
                                         onPressed: (){
                                             Navigator.push(
                                             context,
                                             new MaterialPageRoute(
                                             builder: (context) => new MainScreen()),
                                          );
                                         }
                                        )
                                       )
                                     )
                                   );
                             },
                        )
                )
           ]
         )
       );
     }
  }