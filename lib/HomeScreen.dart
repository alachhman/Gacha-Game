import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomeScreenWidget extends StatelessWidget {


  HomeScreenWidget();

  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Foundation(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/widget': (_) =>
        new WebviewScaffold(
          url: "https://www.google.com/",
          withZoom: false,
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
                  _opennewpage();
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
                    onPressed: null,
                ),
              ))
        ],
      ),
    );
  }
}

