import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/domain.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:infrastructure/event/anticorruption/event_translator.dart';
import 'package:infrastructure/event/dto/event_dto.dart';

class EventRemoteRepository implements EventRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<void> createEvent(Event event) async {
    await _firestore.collection('Events').add({
      'nameEvent': event.getNameEvent(),
      'locationEvent': event.getPlaceOfEvent(),
      'confirmedPlayers': [],
      'rejectedPlayers': [],
      'dateEvent': event.getDateEvent(),
      'startEvent': event.getStartEvent(),
      'endEvent': event.getEndEvent(),
      'imageEvent': event.getImageEvent(),
    }).then((value) => {updateUid(value.id)});
  }

  Future<void> updateUid(String uid) async {
    await _firestore.collection('Events').doc(uid).update({'uid': uid});
  }

  @override
  Future<List<Event>> getAll(DateTime date) async {
    CollectionReference events = _firestore.collection('Events');
    List<Event> all = <Event>[];
    await events
        .where('dateEvent',
            isGreaterThanOrEqualTo:
                Timestamp.fromDate(DateTime(date.year, date.month, date.day)))
        .where('dateEvent',
            isLessThanOrEqualTo: Timestamp.fromDate(
                DateTime(date.year, date.month, date.day + 1)))
        .get()
        .then((value) => value.docs.forEach((element) {
              EventDTO eventDTO = EventDTO.fromFirestore(
                  element.data() as Map<String, dynamic>);
              var event = EventTranslator.firebaseToDomain(eventDTO);
              all.add(event);
            }));
    return all;
  }

  @override
  Future<String> uploadEventImage(File image) async {
    final upload =
        await _storage.ref().child(DateTime.now().toString()).putFile(image);
    return await upload.ref.getDownloadURL();
  }
}
