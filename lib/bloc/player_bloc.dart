import 'package:domain/domain.dart';
import 'package:domain/person/entities/player_data.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/person/dto/physcal_info_dto.dart';
import 'package:intl/intl.dart';

class PlayerBLoC extends ChangeNotifier {
  PlayerBLoC({required PersonServices playerServices})
      : _personServices = playerServices,
        super();

  final PersonServices _personServices;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController cellphoneController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController dorsarlController = TextEditingController();

  final TextEditingController heigthController = TextEditingController();
  final TextEditingController weigthController = TextEditingController();

  String dropdownValue = 'Seleccione';
  String seconddropdownValue = 'Seleccione';

  Future<void> registerPlayer() async {
    if (validate()) {
      try {
        _personServices.registerPlayer(Player(
            name: nameController.text,
            lastName: lastNameController.text,
            uid: "",
            player: PlayerData(
                dorsal: int.parse(dorsarlController.text),
                position: dropdownValue,
                secondaryPosition: seconddropdownValue),
            physicalinfo: PhysicalInfo(
                heigth: int.parse(heigthController.text),
                weight: int.parse(weigthController.text)),
            photoUrl: "",
            dateOfBirth:
                DateFormat.yMMMMEEEEd('es').parse(dateOfBirthController.text),
            email: emailController.text,
            cellphone: cellphoneController.text));
      } catch (e) {
        rethrow;
      }
    }
  }

  bool validate() {
    return nameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        dorsarlController.text.isNotEmpty &&
        !dropdownValue.contains("Seleccione") &&
        !seconddropdownValue.contains("Seleccione") &&
        heigthController.text.isNotEmpty &&
        weigthController.text.isNotEmpty &&
        dateOfBirthController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        cellphoneController.text.isNotEmpty;
  }
}
