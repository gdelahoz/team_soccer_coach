import 'package:infrastructure/person/dto/coach_dto.dart';
import 'package:infrastructure/person/dto/person_dto.dart';

class TeamDTO {
  final List<PersonDTO> archers;
  final List<PersonDTO> defenses;
  final List<PersonDTO> midfielder;
  final List<PersonDTO> strikers;
  final List<Coach> trainers;

  TeamDTO({
    required this.archers,
    required this.defenses,
    required this.midfielder,
    required this.strikers,
    required this.trainers,
  });

  factory TeamDTO.fromFirestore(Map<String, dynamic>? json) {
    return TeamDTO(
        archers: ((json?["archers"]) as List).map((e) {
          return PersonDTO.fromFirestore(e);
        }).toList(),
        defenses: (json?["defenses"] as List).map((e) {
          return PersonDTO.fromFirestore(e);
        }).toList(),
        midfielder: (json?["midfielder"] as List).map((e) {
          return PersonDTO.fromFirestore(e);
        }).toList(),
        strikers: (json?["strikers"] as List).map((e) {
          return PersonDTO.fromFirestore(e);
        }).toList(),
        trainers: (json?["trainers"] as List).map((e) {
          return Coach.fromFirestore(e);
        }).toList());
  }
}
