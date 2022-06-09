class Advertisements {
  Advertisements(
      {required String title, required String content, required String uid}) {
    _setTitle(title);
    _setContent(content);
    _setUid(uid);
  }

  late String _title;
  late String _content;
  late String _uid;

  String getTitle() => _title;
  String getContent() => _content;
  String getUid() => _uid;

  void _setTitle(String title) {
    _title = title;
  }

  void _setContent(String content) {
    _content = content;
  }

  void _setUid(String uid) {
    _uid = uid;
  }
}
