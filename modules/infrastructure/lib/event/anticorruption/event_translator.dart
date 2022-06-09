import 'package:domain/event/entities/event_training.dart'
    as event_training_domain;
import 'package:infrastructure/event/dto/event_dto.dart' as event_firebase;

class EventTranslator {
  static event_training_domain.EventTraining firebaseToDomain(
      event_firebase.EventDTO event) {
    return event_training_domain.EventTraining(
        uid: event.uid,
        typeEvent: 0,
        nameEvent: event.nameEvent,
        imageEvent: event.imageEvent,
        confirmedPlayers: event.confirmedPlayer,
        dateEvent: event.dateEvent,
        placeEvent: event.locationEvent,
        startTime: event.startEvent,
        endTime: event.endEvent);
  }
}
