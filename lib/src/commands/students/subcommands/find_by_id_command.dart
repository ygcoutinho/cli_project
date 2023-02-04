import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/students_repository.dart';

class FindByIdCommand extends Command {
  final StudentsRepository repository;

  FindByIdCommand(this.repository) {
    argParser.addOption('id', abbr: 'i', help: 'Student ID');
  }

  @override
  String get description => 'Find Student by ID';

  @override
  String get name => 'findById';

  @override
  Future<void> run() async {
    final int? studentIdNumber = int.tryParse(argResults?['id']);
    if (studentIdNumber == null) {
      print('Use a valid value: students findById -i [idNumber] or --id=[idNumber]');
      return;
    }

    final student = await repository.findById(studentIdNumber);
    print('------------------------------------');
    print('Student ID ${student.id}:> ${student.name}');
    print('''Address:> 
              Street: ${student.address.street}
              Number: ${student.address.number}
              Zip Code: ${student.address.zipCode}''');
    print('''Courses:> 
              Name: ${student.nameCourses}''');

    print('------------------------------------');
  }
}
