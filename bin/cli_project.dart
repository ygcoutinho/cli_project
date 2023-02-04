import 'package:args/command_runner.dart';
import 'package:cli_project/cli_project.dart' as cli_project;
import 'package:cli_project/src/commands/students/students_command.dart';

void main(List<String> arguments) {
  CommandRunner("CLI", "print de comando")
    ..addCommand(StudentsCommand())
    ..run(arguments);
}
