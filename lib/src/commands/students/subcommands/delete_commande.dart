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
    final studentId = int.tryParse(argResults?['id']);

    if (studentId == null) {
      print('Student id is required');
      return;
    }
    final student = await repository.findById(studentId);
    print('You are certain to delete student ${student.name}? (y/n)');
    final deleteOrNote = stdin.readLineSync()?.toLowerCase();
    if (deleteOrNote == 'y') {
      await repository.deleteById(student);
      print('Student has been deleted');
    } else {
      print('Operation cancelled');
    }
  }
}
