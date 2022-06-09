import 'dart:io';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum EventState { loading, success, error }

class EventBLoC extends ChangeNotifier {
  EventBLoC({required EventServices eventServices})
      : _eventServices = eventServices,
        super();

  final EventServices _eventServices;
  final TextEditingController controllerFecha = TextEditingController();
  final TextEditingController controllerLugar = TextEditingController();
  final TextEditingController controllerDesde = TextEditingController();
  final TextEditingController controllerHasta = TextEditingController();
  final TextEditingController controllerNota = TextEditingController();

  final reason = TextEditingController();
  DateTime date = DateTime.now();
  String dropdownValue = 'Seleccione';
  List<Event> eventsList = <Event>[];
  var state;

  Future getAllEvents() async {
    try {
      state = EventState.loading;
      notifyListeners();
      eventsList = await _eventServices.getAll(date);
      state = EventState.success;
      notifyListeners();
    } catch (e) {
      state = EventState.error;
      notifyListeners();
      print(e);
    }
  }

  void updateDateAndFetchDatah(DateTime dateCalendar) async {
    date = dateCalendar;
    await getAllEvents();
    notifyListeners();
  }

  void createEvent(File image) {
    if (validate(image)) {
      state = EventState.loading;
      notifyListeners();
      _eventServices.addEvent(
          EventTraining(
              uid: '',
              typeEvent: 0,
              nameEvent: dropdownValue,
              imageEvent: '',
              confirmedPlayers: [],
              dateEvent:
                  DateFormat.yMMMMEEEEd('es').parse(controllerFecha.text),
              placeEvent: controllerLugar.text,
              startTime: DateFormat.jm().parse(controllerDesde.text),
              endTime: DateFormat.jm().parse(controllerHasta.text)),
          image);
      state = EventState.success;
      clearData();
      notifyListeners();
    } else {
      state = EventState.error;
      notifyListeners();
      throw Exception("Ingrese toda los campos requeridos");
    }
  }

  bool validate(File image) {
    return controllerDesde.text.isNotEmpty &&
        controllerFecha.text.isNotEmpty &&
        controllerLugar.text.isNotEmpty &&
        controllerHasta.text.isNotEmpty &&
        image.path.isNotEmpty &&
        dropdownValue.isNotEmpty &&
        !dropdownValue.contains("Seleccione");
  }

  void clearData() {
    controllerDesde.clear();
    controllerHasta.clear();
    controllerFecha.clear();
    controllerLugar.clear();
    controllerNota.clear();
  }
}
