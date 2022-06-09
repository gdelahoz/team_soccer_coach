import 'package:domain/person/entities/coach.dart';
import 'package:domain/person/entities/player.dart';

class Team {
  Team({
    required List<Player> archers,
    required List<Player> defenses,
    required List<Player> midfielder,
    required List<Player> strikers,
    required List<Coach> trainers,
  }) {
    _setArchers(archers);
    _setDefenses(defenses);
    _setMidfieldert(midfielder);
    _setImageEvent(strikers);
    _setCoach(trainers);
  }
  late List<Player> _archers;
  late List<Player> _defenses;
  late List<Player> _midfielder;
  late List<Player> _strikers;
  late List<Coach> _trainers;

  List<Player> getArchers() => _archers;
  List<Player> getDefenses() => _defenses;
  List<Player> getMidfielder() => _midfielder;
  List<Player> getStrikers() => _strikers;
  List<Coach> getTrainers() => _trainers;

  void _setArchers(List<Player> archers) {
    _archers = archers;
  }

  void _setDefenses(List<Player> defenses) {
    _defenses = defenses;
  }

  void _setMidfieldert(List<Player> midfielder) {
    _midfielder = midfielder;
  }

  void _setImageEvent(List<Player> strikers) {
    _strikers = strikers;
  }

  void _setCoach(List<Coach> trainers) {
    _trainers = trainers;
  }
}
