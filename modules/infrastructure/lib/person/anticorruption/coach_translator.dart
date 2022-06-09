import 'package:domain/person/entities/coach.dart' as coach_domain;
import 'package:infrastructure/person/dto/coach_dto.dart' as coach_firebase;

class CoachTranslator {
  static coach_domain.Coach firebaseToDomain(coach_firebase.Coach coach) {
    return coach_domain.Coach(
        name: coach.name!,
        lastName: coach.lastName!,
        uid: coach.uid,
        cellphone: coach.cellphone!,
        dateOfBirth: coach.dateOfBirth!,
        email: coach.email,
        photoUrl: coach.photoUrl!);
  }
}
