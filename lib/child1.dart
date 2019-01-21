import 'package:flutter/material.dart';
import 'package:test_app/Example.dart';

class PlaceholderWidget extends StatelessWidget {
  PlaceholderWidget();
  final List<String> unitNames = ["Cherche","Chrom"];
  final List<String> unitImages = ["assets/cherche.png","assets/chrom.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list(),
    );
  }

  Widget _list() {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        return Card(
          child: _card(unitNames[i], unitImages[i])
        );
      },
      itemCount: unitNames.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
  Widget _card(String string, String image){
    return InkWell(
      onTap: (){
        print("tapped");
      },
      child: new Column(
        children: <Widget>[
          Text(string),
          Image.asset(image)
        ],
      ),
    );
  }
}