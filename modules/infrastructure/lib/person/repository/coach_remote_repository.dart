import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/person/entities/coach.dart';
import 'package:domain/person/entities/player.dart';
import 'package:domain/person/repository/person_remote_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infrastructure/person/anticorruption/coach_translator.dart';
import 'package:infrastructure/person/dto/coach_dto.dart' as coach_dto;

class CoachRemoteRepository implements PersonRemoteRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<Coach> loginFirebase(String email, String password) async {
    final authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    var coach;
    await _db
        .collection('Users')
        .where(authResult.user!.uid)
        .get()
        .then((value) => value.docs.forEach((element) {
              final coachDTO = coach_dto.Coach.fromFirestore(element.data());
              coach = CoachTranslator.firebaseToDomain(coachDTO);
            }));
    return coach;
  }

  @override
  void logoutFirebase() {
    // TODO: implement logoutFirebase
  }

  @override
  Future<void> registerUser(Player player) async {
    await _auth
        .createUserWithEmailAndPassword(
            email: player.getEmail(),
            password: '${player.getName().toLowerCase()}${player.getAge()}')
        .then((value) async {
      if (value.user?.uid != null) {
        await registerPlayer(player, value.user!.uid);
      }
    });
  }

  Future<void> registerPlayer(Player player, String uid) async {
    await _db.collection("Users").doc(uid).set({
      'cellphone': player.getCellPhone(),
      'dateOfBirth': player.getDateOfBirth(),
      'email': player.getEmail(),
      'lastName': player.getLastName(),
      'name': player.getName(),
      'photoUrl': "",
      'uid': uid,
      'physicalinfo': player.getPhysicalInfo().toJson(),
      'PlayerData': player.getPlayerData().toJson(),
    }).then((value) async {
      await registerPlayerInTeam(player, uid);
    });
  }

  registerPlayerInTeam(Player player, String uid) async {
    String type = "";
    switch (player.getPlayerData().getPosition()) {
      case "Entrenador":
        type = "trainers";
        break;
      case "Arquero":
        type = "archers";
        break;
      case "Defensor":
        type = "defenses";
        break;
      case "MedioCampista":
        type = "midfielder";
        break;
      case "Delantero":
        type = "strikers";
        break;
    }
    await _db.collection("Teams").doc("SzuE827c51PURUcaCE3N").update({
      type: FieldValue.arrayUnion([player.toJson()])
    });
  }
}
