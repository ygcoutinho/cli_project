import 'dart:async';

import 'package:args/command_runner.dart';

import '../../repositories/students_repository.dart';
import 'subcommands/find_all_command.dart';
import 'subcommands/find_by_id_command.dart';
import 'subcommands/insert_command.dart';
import 'subcommands/update_command.dart';

class StudentsCommand extends Command {
  final StudentsRepository repository = StudentsRepository();
  @override
  String get description => 'Students Commands';

  @override
  String get name => 'students';

  StudentsCommand() {
    addSubcommand(FindAllCommand(repository));
    addSubcommand(FindByIdCommand(repository));
    addSubcommand(InsertCommand(repository));
    addSubcommand(UpdateCommand(repository));
  }
}
