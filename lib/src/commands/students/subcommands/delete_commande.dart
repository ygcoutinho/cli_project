import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/students_repository.dart';

class DeleteCommand extends Command {
  StudentsRepository repository;
  @override
  String get description => 'Delete a student by id';

  @override
  String get name => 'delete';

  DeleteCommand(this.repository) {
    argParser.addOption('id', abbr: 'i', help: 'Student id to be deleted');
  }

  @override
  Future<void> run() async {
    if (argResults?['id'] != '') {
      final studentId = int.parse(argResults?['id']);
      final student = await repository.findById(studentId);
      print('You are certain to delete student ${student.name}? (y/n)');
      final awnser = stdin.readLineSync()?.toLowerCase();
      if (awnser == 'y') {
        await repository.delete(student);
        print('Student has been deleted');
      } else {
        print('Operation cancelled');
      }
    } else {
      print('Student id is required');
    }
  }
}
