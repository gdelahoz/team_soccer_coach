import 'package:domain/person/entities/physical_info.dart';
import 'package:infrastructure/person/anticorruption/player_translator.dart';
import 'package:infrastructure/person/dto/person_dto.dart' as person_firebase;
import 'package:domain/person/entities/player.dart' as player_domain;
import 'package:domain/person/entities/coach.dart' as coach_domain;
import 'package:infrastructure/person/dto/coach_dto.dart' as coach_firebase;

class PersonTranslator {
  static player_domain.Player fromDTOtoDomain(
      person_firebase.PersonDTO person) {
    return player_domain.Player(
      cellphone: person.cellphone ?? "",
      dateOfBirth: person.dateOfBirth ?? DateTime.now(),
      email: person.email,
      lastName: person.lastName ?? "",
      name: person.name ?? "",
      photoUrl: person.photoUrl ?? "",
      physicalinfo:
          PlayerTranslator.physicalInfoFromDTOToDomain(person.phsycalInfoDTO),
      player: PlayerTranslator.fromFirebaseToDomain(person.playerData),
      uid: person.uid,
    );
  }
}

class CoachTranslator {
  static coach_domain.Coach fromDTOtoDomain(coach_firebase.Coach person) {
    return coach_domain.Coach(
      cellphone: person.cellphone ?? "",
      dateOfBirth: person.dateOfBirth ?? DateTime.now(),
      email: person.email,
      lastName: person.lastName ?? "",
      name: person.name ?? "",
      photoUrl: person.photoUrl ?? "",
      uid: "",
    );
  }
}
