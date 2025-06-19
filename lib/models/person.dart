// lib/models/person.dart

class Person {
  final String nombre;
  final String apellido;
  final DateTime fechaNacimiento;
  final String sexo;

  Person({
    required this.nombre,
    required this.apellido,
    required this.fechaNacimiento,
    required this.sexo,
  });
}
