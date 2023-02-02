import 'models/course.dart';
import 'models/student.dart';
import 'repositories/product_repository.dart';
import 'repositories/students_repository.dart';

Future<void> main() async {
  var studentsRepository = StudentsRepository();
  var productsRepository = ProductRepository();
  //List<Student> listStudents = await studentsRepository.findAll();
  //print(listStudents);
  var listCourses = await productsRepository.findByName("Jornada Dart");
  print(listCourses);
  // Student studentById = await studentsRepository.findById(12);
  // print(studentById);
}
