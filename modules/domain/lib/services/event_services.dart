import 'dart:io';

import 'package:domain/event/entities/event.dart';
import 'package:domain/event/entities/event_training.dart';
import 'package:domain/event/repository/event_respository.dart';

class EventServices {
  EventServices({required EventRepository remoteRepo})
      : _remoteRepo = remoteRepo,
        super();

  final EventRepository _remoteRepo;

  Future<List<Event>> getAll(DateTime date) async {
    return await _remoteRepo.getAll(date);
  }

  Future<void> addEvent(Event event, File image) async {
    final urlImage = await _remoteRepo.uploadEventImage(image);
    await _remoteRepo.createEvent(EventTraining(
        confirmedPlayers: [],
        dateEvent: event.getDateEvent(),
        endTime: event.getEndEvent(),
        imageEvent: urlImage,
        nameEvent: event.getNameEvent(),
        placeEvent: event.getPlaceOfEvent(),
        startTime: event.getStartEvent(),
        typeEvent: 0,
        uid: ''));
  }
}
