import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
String selectedUrl = "https://www.nyit.edu/";
class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget();
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeScreen(context),
    );
  }
  Widget homeScreen(BuildContext context) {
    return Container(
      color: Color(0xFF4B3F72),
      height: 650,
      child: new Stack(
        children: <Widget>[
          Align(
              alignment: FractionalOffset.topLeft,
              child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => new Card(
                          color: Color(0xFF4B3F72),
                          margin: EdgeInsets.fromLTRB(20, 125, 20, 100),
                          child:  const WebView(
                            initialUrl: 'https://flutter.dev/',
                            javascriptMode: JavascriptMode.unrestricted,
                          ),
                        )
                    );
                  }
              )
          ),
          Align(
            alignment: FractionalOffset.topCenter,
            child: IconButton(
              icon: Icon(Icons.cake),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => new Card(
                      color: Colors.white,
                      margin: EdgeInsets.fromLTRB(20, 125, 20, 100),
                      child: new Column(
                        children: <Widget>[
                          new ListTile(
                            leading: new Icon(Icons.card_giftcard),
                            title: new Text("gift recieved"),
                            subtitle: new Text("From UserName2"),
                          ),
                          new RaisedButton(
                              onPressed: null,
                              child: const Text("Accept Gift!"),
                          ),
                          new Divider(color: Colors.black),
                          new ListTile(
                            leading: new Icon(Icons.card_giftcard),
                            title: new Text("gift recieved"),
                            subtitle: new Text("From UserName3"),
                          ),
                          new RaisedButton(
                            onPressed: null,
                            child: const Text("Accept Gift!"),
                          ),
                          new Divider(color: Colors.black),
                        ],
                      ),
                    )
                );
              },
            ),
          ),
          new Align(
            alignment: FractionalOffset.topRight,
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) => new Card(
                      color: Color(0xFF4B3F72),
                      margin: EdgeInsets.fromLTRB(20, 125, 20, 100),
                      child: new RaisedButton(
                        child: const Text("SETTINGS"),


                      ),
                    )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


