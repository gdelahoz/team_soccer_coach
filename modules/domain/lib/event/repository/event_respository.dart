import 'dart:io';

import 'package:domain/domain.dart';
import 'package:domain/event/entities/event.dart';

abstract class EventRepository<T extends Event> {
  Future<List<T>> getAll(DateTime date);
  Future<void> createEvent(Event event);
  Future<String> uploadEventImage(File image);
}
