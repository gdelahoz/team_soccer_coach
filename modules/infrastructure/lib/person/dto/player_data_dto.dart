class PlayerDataDTO {
  final int dorsal;
  final String position;
  final String secondaryPosition;

  PlayerDataDTO(
      {required this.dorsal,
      required this.position,
      required this.secondaryPosition});

  factory PlayerDataDTO.fromFirestore(Map<String, dynamic> json) {
    return PlayerDataDTO(
      dorsal: json['dorsal'],
      position: json['position'],
      secondaryPosition: json['secondaryPosition'],
    );
  }
}
