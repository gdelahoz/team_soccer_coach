import 'package:domain/person/entities/player.dart' as personPlayer;
import 'package:infrastructure/person/dto/person_dto.dart' as personFirebase;
import 'package:domain/person/entities/person.dart' as personDomain;

import 'package:infrastructure/person/dto/player_data_dto.dart'
    as playerDataFirebase;

import 'package:domain/person/entities/player_data.dart' as playerDataDomain;

import 'package:domain/person/entities/physical_info.dart'
    as physicalInfoDomain;

import 'package:infrastructure/person/dto/physcal_info_dto.dart'
    as physcalInfoFirebase;

class PlayerTranslator {
  static personDomain.Person fromDTOToDomain(personFirebase.PersonDTO person) {
    personDomain.Person personDTO = personPlayer.Player(
        name: person.name!,
        lastName: person.lastName!,
        photoUrl: person.photoUrl!,
        player: PlayerTranslator.fromFirebaseToDomain(person.playerData),
        physicalinfo:
            PlayerTranslator.physicalInfoFromDTOToDomain(person.phsycalInfoDTO),
        cellphone: person.cellphone!,
        uid: person.uid,
        dateOfBirth: person.dateOfBirth!,
        email: person.email);
    return personDTO;
  }

  static playerDataDomain.PlayerData fromFirebaseToDomain(
      playerDataFirebase.PlayerDataDTO playerData) {
    playerDataDomain.PlayerData playerDto = playerDataDomain.PlayerData(
        dorsal: playerData.dorsal,
        position: playerData.position,
        secondaryPosition: playerData.secondaryPosition);
    return playerDto;
  }

  static physicalInfoDomain.PhysicalInfo physicalInfoFromDTOToDomain(
      physcalInfoFirebase.PhsycalInfoDTO physicalInfo) {
    physicalInfoDomain.PhysicalInfo playerDto = physicalInfoDomain.PhysicalInfo(
        heigth: physicalInfo.heigth, weight: physicalInfo.weight);
    return playerDto;
  }
}
