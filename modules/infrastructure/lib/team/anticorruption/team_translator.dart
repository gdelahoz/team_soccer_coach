import 'package:domain/team/entities/team.dart' as team_domain;
import 'package:infrastructure/team/anticorruption/person_translator.dart';
import 'package:infrastructure/team/dto/team_dto.dart' as team_firebase;

class TeamTranslator {
  static team_domain.Team firebaseToDomain(team_firebase.TeamDTO team) {
    return team_domain.Team(
        archers: team.archers
            .map((data) => PersonTranslator.fromDTOtoDomain(data))
            .toList(),
        defenses: team.defenses
            .map((data) => PersonTranslator.fromDTOtoDomain(data))
            .toList(),
        midfielder: team.midfielder
            .map((data) => PersonTranslator.fromDTOtoDomain(data))
            .toList(),
        strikers: team.strikers
            .map((data) => PersonTranslator.fromDTOtoDomain(data))
            .toList(),
        trainers: team.trainers
            .map((data) => CoachTranslator.fromDTOtoDomain(data))
            .toList());
  }
}
