import 'package:infrastructure/person/dto/physcal_info_dto.dart';
import 'package:infrastructure/person/dto/player_data_dto.dart';

class PersonDTO {
  final String uid;
  final String? name;
  final String? lastName;
  final String email;
  final PlayerDataDTO playerData;
  final PhsycalInfoDTO phsycalInfoDTO;
  final String? cellphone;
  final String? photoUrl;
  final DateTime? dateOfBirth;

  PersonDTO(
      {required this.uid,
      required this.email,
      required this.playerData,
      required this.phsycalInfoDTO,
      this.name,
      this.lastName,
      this.cellphone,
      this.photoUrl,
      this.dateOfBirth});

  factory PersonDTO.fromFirestore(Map<String, dynamic> json) {
    return PersonDTO(
        uid: json['uid'],
        email: json['email'],
        cellphone: json['cellphone'],
        playerData: PlayerDataDTO.fromFirestore(json['playerData']),
        phsycalInfoDTO: PhsycalInfoDTO.fromFirestore(json['physicalinfo']),
        photoUrl: json['photoUrl'],
        dateOfBirth: json['dateOfBirth'].toDate(),
        lastName: json['lastName'],
        name: json['name']);
  }
}
