abstract class Event {
  Event({
    required String uid,
    required int typeEvent,
    required String nameEvent,
    required String imageEvent,
    required List<dynamic> confirmedPlayers,
    required DateTime dateEvent,
    required String placeEvent,
    required DateTime startTime,
    required DateTime endTime,
  }) {
    _setUidEvent(uid);
    _setTypeEvent(typeEvent);
    _setNameEvent(nameEvent);
    _setImageEvent(imageEvent);
    _setConfirmedPlayers(confirmedPlayers);
    _setDateEvent(dateEvent);
    _setPlaceEvent(placeEvent);
    _setStartEvent(startTime);
    _setEndEvent(endTime);
  }

  late String _uid;
  late int _typeEvent;
  late String _nameEvent;
  late String _imageEvent;
  late List<dynamic> _confirmedPlayers;
  late DateTime _dateEvent;
  late String _placeEvent;
  late DateTime _startTime;
  late DateTime _endTime;

  String getUidEvent() => _uid;
  int getTypeEvent() => _typeEvent;
  String getNameEvent() => _nameEvent;
  String getImageEvent() => _imageEvent;
  List<dynamic> getConfirmedPlayers() => _confirmedPlayers;
  DateTime getDateEvent() => _dateEvent;
  String getPlaceOfEvent() => _placeEvent;
  DateTime getStartEvent() => _startTime;
  DateTime getEndEvent() => _endTime;

  void _setTypeEvent(int typeEvent) {
    _typeEvent = typeEvent;
  }

  void _setNameEvent(String nameEvent) {
    _nameEvent = nameEvent;
  }

  void _setPlaceEvent(String placeEvent) {
    _placeEvent = placeEvent;
  }

  void _setStartEvent(DateTime startTime) {
    _startTime = startTime;
  }

  void _setEndEvent(DateTime endTime) {
    _endTime = endTime;
  }

  void _setImageEvent(String imageEvent) {
    _imageEvent = imageEvent;
  }

  void _setDateEvent(DateTime dateEvent) {
    _dateEvent = dateEvent;
  }

  void _setConfirmedPlayers(List confirmedPlayers) {
    _confirmedPlayers = confirmedPlayers;
  }

  void _setUidEvent(String uid) {
    _uid = uid;
  }

  @override
  String toString() {
    return """nameEvent: $_nameEvent imageEvent: $_imageEvent 
    typeEvent: $_typeEvent dateEvent: $_dateEvent placeEvent: 
    $_placeEvent startEvent: $_startTime endEvent: $_endTime""";
  }
}
