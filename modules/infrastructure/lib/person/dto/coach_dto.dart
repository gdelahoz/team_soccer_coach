class Coach {
  final String uid;
  final String? name;
  final String? lastName;
  final String email;
  final String? cellphone;
  final String? photoUrl;
  final DateTime? dateOfBirth;

  Coach(
      {required this.uid,
      required this.email,
      this.name,
      this.lastName,
      this.cellphone,
      this.photoUrl,
      this.dateOfBirth});

  factory Coach.fromFirestore(Map<String, dynamic> json) {
    return Coach(
        uid: json['uid'],
        email: json['email'],
        cellphone: json['cellphone'],
        photoUrl: json['photoUrl'],
        dateOfBirth: json['dateOfBirth'].toDate(),
        lastName: json['lastName'],
        name: json['name']);
  }
}
