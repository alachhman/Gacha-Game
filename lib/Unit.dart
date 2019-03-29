class Unit{
  final String name;
  final String elem;
  final String wep;
  final String sOneName;
  final String sOneDesc;
  final String sTwoName;
  final String sTwoDesc;
  final String ATK_g;
  final String DEF_g;
  final String SPD_g;
  final String HP_g;
  final String ATK_b;
  final String DEF_b;
  final String SPD_b;
  final String HP_b;
  Unit({
    this.name,
    this.elem,
    this.wep,
    this.sOneName,
    this.sOneDesc,
    this.sTwoName,
    this.sTwoDesc,
    this.ATK_g,
    this.DEF_g,
    this.SPD_g,
    this.HP_g,
    this.ATK_b,
    this.DEF_b,
    this.SPD_b,
    this.HP_b
  });
  factory Unit.fromJson(Map<String,dynamic> json){
    return new Unit(
      name: json['name'],
      elem: json['elem'],
      wep: json['wep'],
      sOneName: json['sOneName'],
      sOneDesc: json['sOneDesc'],
      sTwoName: json['sTwoName'],
      sTwoDesc: json['sTwoDesc'],
      ATK_g: json['ATK_g'].toString(),
      DEF_g: json['DEF_g'].toString(),
      SPD_g: json['SPD_g'].toString(),
      HP_g: json['HP_g'].toString(),
      ATK_b: json['ATK_b'].toString(),
      DEF_b: json['DEF_b'].toString(),
      SPD_b: json['SPD_b'].toString(),
      HP_b: json['HP_b'].toString(),
    );
  }
}
class UnitsfromJson {
  final List<Unit> units;
  UnitsfromJson({
    this.units,
  });
  factory UnitsfromJson.fromJson(List<dynamic> parsedJson) {
    List<Unit> units = new List<Unit>();
    units = parsedJson.map((i)=>Unit.fromJson(i)).toList();
    return new UnitsfromJson(
      units: units,
    );
  }
}
