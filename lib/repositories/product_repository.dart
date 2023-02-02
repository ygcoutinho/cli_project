import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/course.dart';

class ProductRepository {
  Future<Course> findByName(String name) async {
    final response = await http.get(Uri.parse("http://localhost:8080/products?name=$name"));

    if (response.statusCode != 200) {
      throw Exception();
    }

    final responseData = jsonDecode(response.body);

    if (responseData.isEmpty) {
      throw Exception("Course not found");
    }

    return Course.fromMap(responseData.first);
  }
}
