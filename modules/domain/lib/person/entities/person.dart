import 'package:domain/person/exceptions/person_exception.dart';

abstract class Person {
  Person(
      {required String name,
      required String lastName,
      required String uid,
      required DateTime dateOfBirth,
      required String email,
      required String photoUrl,
      required String cellphone}) {
    _setName(name);
    _setLastName(lastName);
    _setUid(uid);
    _setDateOfBith(dateOfBirth);
    _setPhotoUrl(photoUrl);
    _setEmail(email);
    _setCellphone(cellphone);
  }

  late String _name;
  late String _lastName;
  late String _uid;
  late DateTime _dateOfBirth;
  late String _email;
  late String _cellphone;
  late String _photoUrl;

  String getName() => _name;
  String getLastName() => _lastName;
  String getFullName() => "$_name $_lastName";
  String getUid() => _uid;
  String getEmail() => _email;
  String getCellPhone() => _cellphone;
  String getPhotoUrl() => _photoUrl;
  DateTime getDateOfBirth() => _dateOfBirth;
  int getAge() {
    final dateNow = DateTime.now();
    return dateNow.year - _dateOfBirth.year;
  }

  void _setName(String name) {
    _name = name;
  }

  void _setLastName(String lastName) {
    _lastName = lastName;
  }

  void _setDateOfBith(DateTime dateOfBirth) {
    _dateOfBirth = dateOfBirth;
  }

  void _setEmail(String email) {
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email)) {
      throw const EmailException();
    }
    _email = email;
  }

  void _setCellphone(String cellphone) {
    _cellphone = cellphone;
  }

  void _setUid(String uid) {
    _uid = uid;
  }

  void _setPhotoUrl(String photoUrl) {
    _photoUrl = photoUrl;
  }

  @override
  String toString() {
    return """name: ${getName()} birthDay: $_dateOfBirth 
    email: $_email cellphone: $_cellphone uid: 
    $_uid """;
  }
}
