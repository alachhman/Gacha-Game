import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UnitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('kUnitList').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new GridView.count(
          crossAxisCount: 4,
          children: snapshot.data.documents.map((document) {
            return new GridTile(
                child: new Card(
                    color: Colors.blue.shade200,
                    child: new Center(
                      child: new Text(document['name'] ?? 'Doesnt exist'),
                    )
                )

            );
          }).toList(),
        );
      },
    );
  }
}
