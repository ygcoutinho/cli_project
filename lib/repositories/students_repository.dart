import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/student.dart';

class StudentsRepository {
  Future<List<Student>> findAll() async {
    var response = await http.get(Uri.parse("http://localhost:8080/students"));
    var listStudents = jsonDecode(response.body);
    return listStudents.map<Student>((student) => Student.fromMap(student)).toList();
  }
}
