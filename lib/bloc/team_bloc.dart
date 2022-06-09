import 'package:domain/services/team_services.dart';
import 'package:domain/team/entities/team.dart';
import 'package:flutter/material.dart';

class TeamBLoC extends ChangeNotifier {
  TeamBLoC({required TeamServices eventServices})
      : _teamServices = eventServices,
        super();

  Team myTeam = Team(
      archers: [], defenses: [], midfielder: [], strikers: [], trainers: []);
  final TeamServices _teamServices;

  void getTeam() async {
    try {
      myTeam = (await _teamServices.getAll())!;
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
