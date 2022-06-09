import 'person.dart';

class Coach extends Person {
  Coach(
      {required String name,
      required String lastName,
      required String uid,
      required String photoUrl,
      required DateTime dateOfBirth,
      required String email,
      required String cellphone})
      : super(
            name: name,
            lastName: lastName,
            uid: uid,
            photoUrl: photoUrl,
            dateOfBirth: dateOfBirth,
            email: email,
            cellphone: cellphone);
}
