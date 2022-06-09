class PlayerData {
  PlayerData(
      {required int dorsal,
      required String position,
      required String secondaryPosition}) {
    _setDorsal(dorsal);
    _setPosition(position);
    _setSecondaryPosition(secondaryPosition);
  }
  late int _dorsal;
  late String _position;
  late String _secondaryPosition;

  int getDorsal() => _dorsal;
  String getPosition() => _position;
  String getSecondaryPosition() => _secondaryPosition;

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    return PlayerData(
        dorsal: json['dorsal'],
        position: json['position'],
        secondaryPosition: json['secondaryPosition']);
  }

  void _setDorsal(int dorsal) {
    _dorsal = dorsal;
  }

  void _setPosition(String position) {
    _position = position;
  }

  void _setSecondaryPosition(String secondaryPosition) {
    _secondaryPosition = secondaryPosition;
  }

  Map<String, dynamic> toJson() => {
        'dorsal': getDorsal(),
        'position': getPosition(),
        'secondaryPosition': getSecondaryPosition(),
      };
}
