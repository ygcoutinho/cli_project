import 'dart:convert';

class Course {
  final int id;
  final String name;
  final bool isStudent;

  Course({required this.id, required this.name, required this.isStudent});

  //toMap
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "isStudent": isStudent,
    };
  }

  //toJson
  String toJson() => jsonEncode(toMap());

  //fromMap
  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map["id"] ?? 0,
      name: map["name"] ?? "",
      isStudent: map["isStudent"] ?? false,
    );
  }

  //fromJson
  factory Course.fromJson(String json) => Course.fromMap(jsonDecode(json));
}
