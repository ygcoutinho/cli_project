import 'models/student.dart';
import 'repositories/students_repository.dart';

Future<void> main() async {
  var studentsRepository = StudentsRepository();
  List<Student> listStudents = await studentsRepository.findAll();
  print(listStudents);
}
