class EventDTO {
  final String uid;
  final String nameEvent;
  final String locationEvent;
  final String imageEvent;
  final List<dynamic> confirmedPlayer;
  final DateTime dateEvent;
  final DateTime startEvent;
  final DateTime endEvent;

  EventDTO(
      {required this.uid,
      required this.nameEvent,
      required this.locationEvent,
      required this.imageEvent,
      required this.confirmedPlayer,
      required this.dateEvent,
      required this.startEvent,
      required this.endEvent});

  factory EventDTO.fromFirestore(Map<String, dynamic> json) {
    return EventDTO(
        uid: json['uid'],
        nameEvent: json['nameEvent'],
        locationEvent: json['locationEvent'],
        confirmedPlayer: json['confirmedPlayers'],
        imageEvent: json['imageEvent'],
        dateEvent: json['dateEvent'].toDate(),
        startEvent: json['startEvent'].toDate(),
        endEvent: json['endEvent'].toDate());
  }
}
