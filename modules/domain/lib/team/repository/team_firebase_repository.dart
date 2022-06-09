import 'package:domain/team/entities/team.dart';

abstract class TeamFirebaseRepository {
  Future<Team?> getTeam();
}
