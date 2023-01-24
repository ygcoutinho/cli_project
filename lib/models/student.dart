import 'dart:convert';

import 'address.dart';
import 'course.dart';

class Student {
  int id;
  String name;
  int? age;
  List<String> nameCourses;
  List<Course> courses;
  Address address;

  Student({
    required this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  //toMap
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "age": age ?? 0,
      "nameCourses": nameCourses,
      "courses": courses.map((e) => e.toMap()).toList(),
      "address": address,
    };
  }

  //toJson
  String toJson() => jsonEncode(toMap());

  //fromMap
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map["id"] ?? 0,
      name: map["name"] ?? "",
      age: map["age"] ?? 0,
      nameCourses: map["nameCourses"] ?? <String>[],
      courses: map["courses"].map((e) => Course.fromMap(e)).toList() ?? <Course>{},
      address: Address.fromMap(map["address"] ?? <String, dynamic>{}),
    );
  }
  //fromJson
  factory Student.fromJson(String json) => Student.fromMap(jsonDecode(json));
}
