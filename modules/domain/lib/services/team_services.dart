import 'package:domain/team/entities/team.dart';
import 'package:domain/team/repository/team_firebase_repository.dart';

class TeamServices {
  TeamServices({required TeamFirebaseRepository remoteRepo})
      : _remoteRepo = remoteRepo,
        super();

  final TeamFirebaseRepository _remoteRepo;

  Future<Team?> getAll() async {
    return await _remoteRepo.getTeam();
  }
}
