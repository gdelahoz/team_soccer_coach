class Advertisements {
  final String uid;
  final String title;
  final String content;

  Advertisements(
      {required this.uid, required this.title, required this.content});

  factory Advertisements.fromFirestore(Map<String, dynamic> json) {
    return Advertisements(
      uid: json['uid'],
      title: json['title'],
      content: json['content'],
    );
  }
}
