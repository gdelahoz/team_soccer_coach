import 'package:domain/person/entities/physical_info.dart';
import 'package:domain/person/entities/player_data.dart';

import 'person.dart';

class Player extends Person {
  Player(
      {required String name,
      required String lastName,
      required String uid,
      required PlayerData? player,
      required PhysicalInfo? physicalinfo,
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
            cellphone: cellphone) {
    _setPlayerData(player);
    _setPhysicalInfo(physicalinfo);
  }
  late PlayerData _player;
  late PhysicalInfo _physicalinfo;

  PlayerData getPlayerData() => _player;
  PhysicalInfo getPhysicalInfo() => _physicalinfo;

  void _setPlayerData(PlayerData? player) {
    _player = player!;
  }

  void _setPhysicalInfo(PhysicalInfo? physicalinfo) {
    _physicalinfo = physicalinfo!;
  }

  Map<String, dynamic> toJson() => {
        'cellphone': getCellPhone(),
        'dateOfBirth': getDateOfBirth(),
        'email': getEmail(),
        'lastName': getLastName(),
        'name': getName(),
        'photoUrl': getPhotoUrl(),
        'physicalinfo': getPhysicalInfo().toJson(),
        'playerData': getPlayerData().toJson(),
        'uid': getUid(),
      };
}
