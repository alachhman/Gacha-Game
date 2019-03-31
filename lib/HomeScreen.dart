import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String selectedUrl = "https://www.youtube.com/";

class HomeScreenWidget extends StatelessWidget {


  HomeScreenWidget();

  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Foundation(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/widget': (_) =>
        new WebviewScaffold(
          url: selectedUrl,
          withZoom: true,
          withLocalStorage: true,


        ),
      },
    );
  }
}

class Foundation extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<Foundation> {

  void _opennewpage() {
    Navigator.of(context).pushNamed('/widget');
  }


  final flutterWebviewPlugin = new FlutterWebviewPlugin();





  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF4B3F72),
      height: 650,
      child: new Stack(
        children: <Widget>[
          new Positioned(
            child: new Align(
              alignment: FractionalOffset.topLeft,
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  flutterWebviewPlugin.launch(selectedUrl,
                      rect: new Rect.fromLTWH(
                          0.0, 220.0, MediaQuery.of(context).size.width, 300.0)
                  );

                },

              ),
            ),
          ),
          new Positioned(
            child: new Align(
              alignment: FractionalOffset.topCenter,
              child: IconButton(
                icon: Icon(Icons.cake),
                onPressed: () {
                  showDialog(
                      context: context,
                    builder: (BuildContext context) => new Card(
                      child: const Text("yellow"),
                    )
                  );
                },
              ),
            ),
          ),
          new Positioned(
              child: new Align(
                alignment: FractionalOffset.topRight,
                child: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: (){
                      showDialog(
                          context: context,
                        builder: (BuildContext context) => new Card(
                          child: new RaisedButton(
                            child: const Text("LogOut"),
                          ),
                        )
                      );
                    },
                ),
              ))
        ],
      ),
    );
  }
}


