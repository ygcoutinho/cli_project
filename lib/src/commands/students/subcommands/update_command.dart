import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../models/address.dart';
import '../../../models/city.dart';
import '../../../models/phone.dart';
import '../../../models/student.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/students_repository.dart';

class UpdateCommand extends Command {
  final StudentsRepository repository;
  final productRepository = ProductRepository();

  UpdateCommand(this.repository) {
    argParser.addOption('file', abbr: 'f', help: 'Path of the CSV file');
    argParser.addOption('id', abbr: 'i', help: 'Student ID');
  }

  @override
  String get description => 'Update student';

  @override
  String get name => 'update';

  @override
  Future<void> run() async {
    var students = File(argResults?['file']).readAsLinesSync();
    var studentId = argResults?['id'];

    if (studentId == null) {
      print('Student id must be informand by the command -i [id] or --id=[id]');
      return;
    }

    if (students.length > 1) {
      print(students.length);
      print('You can only update one student per time, please check the file ${argResults?['file']}');
      return;
    }

    final studentSplited = students.first.split(';');
    final courseSplited = studentSplited[2].split(',').map((e) => e.trim()).toList();
    print(courseSplited);
    print(studentSplited);

    final coursesFutures = courseSplited.map((e) async {
      final course = await productRepository.findByName(e);
      course.isStudent = true;
      return course;
    }).toList();

    final coursesRec = await Future.wait(coursesFutures);

    final studentModel = Student(
      id: int.parse(studentId),
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
    print(studentModel);
    //repository.update(studentModel);

    print('Students successfully updated');
  }
}
