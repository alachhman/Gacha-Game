import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:jfinalproject/Unit.dart';

Future<String> _loadUnitFile() async {
  return await rootBundle.loadString('assets/info/units.json');
}
Future loadUnit(List<Unit> units) async {
  String jsonString = await _loadUnitFile();
  final jsonResponse = json.decode(jsonString);
  num unitCountInJson = 3;
  for(int i = 0; i < unitCountInJson; i++){
    Unit unit = new Unit.fromJson(jsonResponse[i]);
    units.add(unit);
    print(unit.name + " added");
  }
  return units;
}