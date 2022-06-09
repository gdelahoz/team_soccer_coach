import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:infrastructure/team/anticorruption/team_translator.dart';
import 'package:infrastructure/team/dto/team_dto.dart';

class TeamFirebaseRepositoryImpl implements TeamFirebaseRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<Team?> getTeam() async {
    try {
      Team? myTeam;
      final team = _firestore.collection("Teams").doc("SzuE827c51PURUcaCE3N");
      TeamDTO teamDTO;
      await team.get().then((value) {
        teamDTO = TeamDTO.fromFirestore(value.data());
        myTeam = TeamTranslator.firebaseToDomain(teamDTO);
      });
      return myTeam;
    } catch (e) {
      rethrow;
    }
  }
}
