import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/students_repository.dart';

class FindAllCommand extends Command {
  StudentsRepository repository;

  FindAllCommand(this.repository);

  @override
  String get description => 'Find all Students';

  @override
  String get name => 'findAll';

  @override
  Future<void> run() async {
    final students = await repository.findAll();

    print('Display courses? (Y/N)');
    final String? showCourse = stdin.readLineSync()?.toLowerCase();

    for (var student in students) {
      print('------------------------------------');
      print('Student:> ${student.name}');
      if (showCourse == 'y') {
        print('Courses:> ${student.nameCourses}');
      }
    }
  }
}
