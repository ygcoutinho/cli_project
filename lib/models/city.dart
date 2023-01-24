import 'dart:convert';

class City {
  int id;
  String name;

  City({required this.id, required this.name});

  //toMap
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }

  //toJson
  String toJson() => jsonEncode(toMap());

  //fromMap
  factory City.fromMap(Map<String, dynamic> map) {
    return City(id: map["id"] ?? 0, name: map["name"] ?? "");
  }

  //fromJson
  factory City.fromJson(String json) => City.fromMap(jsonDecode(json));
}