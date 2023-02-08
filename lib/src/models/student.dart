import 'dart:convert';

import 'address.dart';
import 'course.dart';

class Student {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Course> courses;
  final Address address;

  Student({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  //toMap
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'nameCourses': nameCourses,
      'courses': courses.map((e) => e.toMap()).toList(),
      'address': address,
    };
    if (age != 0) {
      map['age'] = age;
    }
    return map;
  }

  //toJson
  String toJson() => jsonEncode(toMap());

  //fromMap
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      nameCourses: List<String>.from(map['nameCourses'] ?? <String>[]),
      courses: map['courses']?.map<Course>((e) => Course.fromMap(e)).toList() ?? <Course>[],
      address: Address.fromMap(map['address'] ?? <String, dynamic>{}),
    );
  }
  //fromJson
  factory Student.fromJson(String json) => Student.fromMap(jsonDecode(json));

  @override
  String toString() {
    return ('''
              id: $id, 
               name: $name, 
               nameCourses: $nameCourses, 
               courses: $courses, 
               address: $address
               ''');
  }
}
