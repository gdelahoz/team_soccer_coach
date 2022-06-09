import 'package:domain/person/entities/person.dart';

abstract class PersonLocalRespository<T extends Person> {
  Future<bool> savePerson(T person);
  Future<T?> getPerson(String email);
  Future<void> updatePersona(T person);
}
