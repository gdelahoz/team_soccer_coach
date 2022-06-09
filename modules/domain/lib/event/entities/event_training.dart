import 'package:domain/domain.dart';
import 'package:domain/event/entities/event.dart';

class EventTraining extends Event {
  EventTraining(
      {required String uid,
      required int typeEvent,
      required String nameEvent,
      required String imageEvent,
      required List confirmedPlayers,
      required DateTime dateEvent,
      required String placeEvent,
      required DateTime startTime,
      required DateTime endTime})
      : super(
            uid: uid,
            typeEvent: typeEvent,
            nameEvent: nameEvent,
            imageEvent: imageEvent,
            confirmedPlayers: confirmedPlayers,
            dateEvent: dateEvent,
            placeEvent: placeEvent,
            startTime: startTime,
            endTime: endTime);
}
