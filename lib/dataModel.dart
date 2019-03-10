import 'dart:convert';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Client {
  int id;
  String unit_1;
  String unit_2;
  String unit_3;

  Client({
    this.id,
    this.unit_1,
    this.unit_2,
    this.unit_3,
  });

  factory Client.fromMap(Map<String, dynamic> json) => new Client(
    id: json["id"],
    unit_1: json["unit_1"],
    unit_2: json["unit_2"],
    unit_3: json["unit_3"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "unit_1": unit_1,
    "unit_2": unit_2,
    "unit_3": unit_3,
  };
}
