import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../models/address.dart';
import '../../../models/city.dart';
import '../../../models/phone.dart';
import '../../../models/student.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/students_repository.dart';

class InsertCommand extends Command {
  final StudentsRepository repository;
  final productRepository = ProductRepository();

  InsertCommand(this.repository) {
    argParser.addOption('file', abbr: 'f', help: 'Path of the CSV file');
  }

  @override
  String get description => 'Insert students';

  @override
  String get name => 'insert';

  @override
  Future<void> run() async {
    print(argResults?['file']);

    var count = 0;
    var students = File(argResults?['file']).readAsLinesSync();
    for (var student in students) {
      final studentSplited = student.split(';');
      final courseSplited = studentSplited[2].split(',').map((e) => e.trim()).toList();

      final coursesFutures = courseSplited.map((e) async {
        final course = await productRepository.findByName(e);
        course.isStudent = true;
        return course;
      }).toList();

      final coursesRec = await Future.wait(coursesFutures);

      final studentModel = Student(
        name: studentSplited[0],
        age: int.tryParse(studentSplited[1]),
        nameCourses: courseSplited,
        courses: coursesRec,
        address: Address(
          street: studentSplited[3],
          number: int.parse(studentSplited[4]),
          zipCode: studentSplited[5],
          city: City(id: 1, name: studentSplited[6]),
          phone: Phone(ddd: int.parse(studentSplited[7]), phone: studentSplited[8]),
        ),
      );
      repository.insert(studentModel);

      count++;
    }
    print('$count students successfully registered');
  }
}
